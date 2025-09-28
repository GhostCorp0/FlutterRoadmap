import 'package:flutter/material.dart';
import 'package:flutter_roadmap/dio/models/request_job_model.dart';
import 'package:flutter_roadmap/dio/network_manager/repository.dart';

class DioDeleteExampleScreen extends StatefulWidget {
  const DioDeleteExampleScreen({super.key});

  @override
  State<DioDeleteExampleScreen> createState() => _DioDeleteExampleScreenState();
}

class _DioDeleteExampleScreenState extends State<DioDeleteExampleScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("DELETE API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });

                    Repository().deleteJob("2").then((value) {
                      print("Delete Successfully");
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      print("Error => ${error.toString()}");
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
