
import 'package:dio/dio.dart';
import 'injection_container.dart';

class DioHelper {
  Dio dio = getDio();

  Options options = Options(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10)
  );

  Map<String, dynamic> headers = {
    "x-api-key": "reqres-free-v1",
    "Content-Type": "application/json",
  };


  // GET API
  Future<dynamic> get ({required String url ,bool isAuthRequired = false}) async {
    if(isAuthRequired) {options.headers = headers;}

    try{
      Response response = await dio.get(url,options: options);
      return response.data;
    }catch (error) {
      return null;
    }
  }

  //POST API
  Future<dynamic> post ({required String url,Object? requestBody,bool isAuthRequired = true}) async {
    if(isAuthRequired){options.headers = headers;}

    try {
      Response response;
      if(requestBody == null){
        response = await dio.post(url,options: options);
      }else{
        response = await dio.post(url,data: requestBody,options: options);
      }
      return response.data;
    }on DioException catch (dioError) {
      print("Dio error: ${dioError.response?.data ?? dioError.message}");
      throw dioError;
    } catch(error) {
      throw error;
    }
  }

  //PUT API
  Future<dynamic> put ({required String url,Object? requestBody,bool isAuthRequired = true}) async {
    if(isAuthRequired){options.headers = headers;}

    try {
      Response response;
      if(requestBody == null){
        response = await dio.put(url,options: options);
      }else{
        response = await dio.put(url,data: requestBody,options: options);
      }
      return response.data;
    } catch(error) {
      return null;
    }
  }

  //PATCH API
  Future<dynamic> patch ({required String url,Object? requestBody,bool isAuthRequired = true}) async {
    if(isAuthRequired){options.headers = headers;}

    try {
      Response response;
      if(requestBody == null){
        response = await dio.patch(url,options: options);
      }else{
        response = await dio.patch(url,data: requestBody,options: options);
      }
      return response.data;
    } catch(error) {
      return null;
    }
  }

  //DELETE API
  Future<dynamic> delete ({required String url,Object? requestBody,bool isAuthRequired = true}) async {
    if(isAuthRequired){options.headers = headers;}

    try {
      Response response;
      if(requestBody == null){
        response = await dio.delete(url,options: options);
      }else{
        response = await dio.delete(url,data: requestBody,options: options);
      }
      return response.data;
    } catch(error) {
      return null;
    }
  }

  //MULTIPART API
  Future<dynamic> uploadFile ({required String url,Object? requestBody,bool isAuthRequired = true}) async {
    Options option = Options(
        headers: {"Content-Type": "multipart/form-data"}
    );


    try {
      Response response;
      response = await dio.post(url,data: requestBody,options: option);
      return response.data;
    }on DioException catch (dioError) {
      print("Dio error: ${dioError.response?.data ?? dioError.message}");
      throw dioError;
    } catch(error) {
      throw error;
    }
  }

}