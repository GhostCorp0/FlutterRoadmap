import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/dio/network_manager/repository.dart';
import 'package:image_picker/image_picker.dart';

class DioMultipartScreen extends StatefulWidget {
  const DioMultipartScreen({super.key});

  @override
  State<DioMultipartScreen> createState() => _DioMultipartScreenState();
}

class _DioMultipartScreenState extends State<DioMultipartScreen> {
  bool loading = false;
  File? selectedImage;
  String? fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MULTIPART API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async{
                ImagePicker imagePicker = ImagePicker();
                XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                if(file != null){
                  selectedImage = File(file.path);
                  fileName = file.name;
                  setState(() {});
                }
              },
              child: selectedImage == null? Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 50),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Text("Select Image"),
              ): Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 50),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(fit:BoxFit.cover,image: FileImage(selectedImage!))
                ),
              ),
            ),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{
                  if(selectedImage != null) {
                    setState(() {loading = true;});
                    FormData formData = FormData.fromMap({
                      "file": await MultipartFile.fromFile(selectedImage!.path,filename: fileName)
                    });

                    Repository().uploadImage(formData).then((value) {
                      print("Image Url ==>  ${value.location}");
                      loading = false;
                      setState(() {});
                    }).onError((error, stackTrace) {
                      print("Error ==>  ${error.toString()}");
                    });
                  }else {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select image")));
                  }
                },
                child: loading? const CircularProgressIndicator(): const Text("Upload"),
              )
            )
          ],
        ),
      ),
    );
  }
}
