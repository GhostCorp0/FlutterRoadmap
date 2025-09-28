

import 'package:flutter_roadmap/dio/models/create_job_model.dart';
import 'package:flutter_roadmap/dio/models/put_job_model.dart';
import 'package:flutter_roadmap/dio/models/response_in_list_model.dart';
import 'package:flutter_roadmap/dio/models/upload_file_model.dart';
import 'package:flutter_roadmap/dio/network_manager/dio_helper.dart';

import '../models/response_in_map_model.dart';

class Repository {
  static final DioHelper _dioHelper = DioHelper();

  Future<ResponseInMapModel> responseInMap() async {
    var response = await _dioHelper.get(url: "https://reqres.in/api/users?page=2");
    return ResponseInMapModel.fromJson(response);
  }

  Future<List<ResponseInListModel>> responseInList() async {
    List<dynamic> response = await _dioHelper.get(url: "https://jsonplaceholder.typicode.com/posts");
    return List<ResponseInListModel>.from(response.map((e) => ResponseInListModel.fromJson(e)));
  }


  Future<dynamic> responseInMapWithoutModel() async {
    var response = await _dioHelper.get(url: "https://reqres.in/api/users?page=2");
    return response;
  }

  Future<dynamic> responseInListWithoutModel() async {
    List<dynamic> response = await _dioHelper.get(url: "https://jsonplaceholder.typicode.com/posts");
    return response;
  }

  Future<CreateJobModel> createJob(Object requestBody) async {
    var response = await _dioHelper.post(url: "https://reqres.in/api/user",requestBody: requestBody);
    return CreateJobModel.fromJson(response);
  }

  Future<dynamic> createJobWithoutModel (Object requestBody) async {
    Map<String,dynamic> response = await _dioHelper.post(url: "https://reqres.in/api/user",requestBody: requestBody);
    return response;
  }

  Future<PutJobModel> updateJob(Object requestBody,String id) async {
    var response = await _dioHelper.put(url: "https://reqres.in/api/user/$id",requestBody: requestBody);
    return PutJobModel.fromJson(response);
  }

  Future<dynamic> updateJobWithoutModel( Object requestBody,String id) async {
    Map<String,dynamic> response = await _dioHelper.put(url: "https://reqres.in/api/user/$id",requestBody: requestBody);
    return response;
  }

  Future<PutJobModel> patchJob(Object requestBody,String id) async {
    var response = await _dioHelper.patch(url: "https://reqres.in/api/user/$id",requestBody: requestBody);
    return PutJobModel.fromJson(response);
  } 

  Future<dynamic> patchJobWithoutModel(Object requestBody,String id) async {
    Map<String,dynamic> response = await _dioHelper.patch(url: "https://reqres.in/api/user/$id",requestBody: requestBody);
    return response;
  }

  Future<dynamic> deleteJob (String id) async {
    var response = await _dioHelper.delete(url: "https://reqres.in/api/user/$id");
    return response;
  }

  Future<UploadFileModel> uploadImage(Object requestBody) async {
    Map<String,dynamic> response = await _dioHelper.uploadFile(url: "https://api.esculejas.co/api/v1/files/upload",requestBody: requestBody);
    return UploadFileModel.fromJson(response);
  }

}