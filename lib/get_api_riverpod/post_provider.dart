

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postsList = data.map((item) => PostModel.fromJson(item)).toList();
      return postsList;
    }else {
      throw "Something went wrong";
    }
  } catch(e) {
    rethrow;
  }
});//FutureProvider

class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel({required this.id,required this.userId,required this.title,required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}