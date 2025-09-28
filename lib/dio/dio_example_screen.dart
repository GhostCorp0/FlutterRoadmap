import 'package:flutter/material.dart';
import 'package:flutter_roadmap/dio/models/response_in_list_model.dart';
import 'package:flutter_roadmap/dio/models/response_in_map_model.dart';

import 'network_manager/repository.dart';

class DioExampleScreen extends StatefulWidget {
  const DioExampleScreen({super.key});

  @override
  State<DioExampleScreen> createState() => _DioExampleScreenState();
}

// EXAMPLE FOR MAP RESPONSE FROM API
/*
class _DioExampleScreenState extends State<DioExampleScreen> {
  ResponseInMapModel responseInMapModel = ResponseInMapModel();

  bool loading = true;

  getData() {
    Repository().responseInMap().then((value) {
      responseInMapModel = value;
      loading = false;
      setState(() {});
    }).onError((error,stackTrace) {
      print("Error => ${error.toString()}");
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,title: Text("GET API",style: TextStyle(color: Colors.white),),),
      body: loading? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: responseInMapModel.data?.length??0,
          itemBuilder: (context,index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(responseInMapModel.data?[index].avatar??""),
              ),
              title: Text(responseInMapModel.data?[index].firstName??""),
              subtitle: Text(responseInMapModel.data?[index].email??""),
            );
          }),
    );
  }
}
*/


//EXAMPLE FOR LIST RESPONSE FROM API
/*
class _DioExampleScreenState extends State<DioExampleScreen> {
  List<ResponseInListModel> responseInListModel = [];

  bool loading = true;

  getData() {
    Repository().responseInList().then((value) {
      responseInListModel = value;
      loading = false;
      setState(() {});
    }).onError((error,stackTrace) {
      print("Error => ${error.toString()}");
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,title: Text("GET API",style: TextStyle(color: Colors.white),),),
      body: loading? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: responseInListModel.length??0,
          itemBuilder: (context,index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(responseInListModel[index].id.toString()),
              ),
              title: Text(responseInListModel[index].title??""),
              subtitle: Text(responseInListModel[index].body??""),
            );
          }),
    );
  }
}
*/

//Example for map in response without  model
class _DioExampleScreenState extends State<DioExampleScreen> {

  bool loading = true;

  Map<String,dynamic> response = {};

  getData() {
    Repository().responseInMapWithoutModel().then((value) {
      response = value;
      loading = false;
      setState(() {});
    }).onError((error,stackTrace) {
      print("Error => ${error.toString()}");
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black,title: Text("GET API",style: TextStyle(color: Colors.white),),),
      body: loading? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: response['data'].length,
          itemBuilder: (context,index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(response['data'][index]['avatar']??""),
              ),
              title: Text(response['data'][index]['first_name']??""),
              subtitle: Text(response['data'][index]['last_name']??""),
            );
          }),
    );
  }
}































