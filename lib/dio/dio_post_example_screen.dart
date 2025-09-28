import 'package:flutter/material.dart';
import 'package:flutter_roadmap/dio/models/request_job_model.dart';
import 'package:flutter_roadmap/dio/network_manager/repository.dart';

class DioPostExampleScreen extends StatefulWidget {
  const DioPostExampleScreen({super.key});

  @override
  State<DioPostExampleScreen> createState() => _DioPostExampleScreenState();
}

class _DioPostExampleScreenState extends State<DioPostExampleScreen> {
  bool loading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("POST API"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
        TextField(
        controller: nameController,
        decoration: const InputDecoration(
          hintText: "Enter Name",
        ),
      ),

      const SizedBox(height: 30,),

      TextField(
        controller: jobController,
        decoration: const InputDecoration(
          hintText: "Enter Job",
        ),
      ),

      const SizedBox(height: 30,),

      SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(onPressed: () {
          setState(() {loading = true;});

          RequestJobModel requestJobModel = RequestJobModel();
          requestJobModel.name = nameController.text;
          requestJobModel.job = jobController.text;

         /* Map params = {
            "name": nameController.text,
            "job": jobController.text
          };*/

          Repository().createJob(requestJobModel).then((value){
            print("Response => ${value.id.toString()}");
            setState(() {
              loading = false;
            });
          }).onError((error,stackTrace){
            print("Error => ${error.toString()}");
            setState(() {loading = false;});
          });
        }, child: loading ? const CircularProgressIndicator():const Text("Submit")),
      )

      ],
    ),)
    ,
    );
  }
}
