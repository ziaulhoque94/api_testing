import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'model/create_post_model.dart';

class http_controller extends GetxController{

  Rx<TextEditingController> titleController=TextEditingController().obs;
  Rx<TextEditingController> bodyController=TextEditingController().obs;

  List<Post_model> postList=[];




  Future<List<Post_model>> fetchPosts() async{
    final url=Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url);
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      postList.clear();
      for(Map i in data){
        postList.add(Post_model.fromJson(i));
      }
      return postList;
    }else{
      throw Exception("Failed to load post");
    }

  }

  Future<Post_model> createdPost(String title, String body) async{
    Map<String, dynamic> request = {
      "title":title,
      "body":body,
      "userId":"111"
    };

    final url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.post(url, body: request);
    if(response.statusCode==201){
      return Post_model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load posts");
    }
  }

  Future<Post_model> updatePost(String title, String body) async{
    Map<String, dynamic> request={
      'id':"101",
      'title':title,
      'body':body,
      'userId':"111"
    };
    final url=Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
    final response = await http.put(url, body: request);

    if(response.statusCode==200){
      print("Update sucess");
      return Post_model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load posts");
    }
  }

  Future<Post_model?>? deletePost() async{
    final url=Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.delete(url);

    if(response.statusCode==200){
      return null;
      // return Post_model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load post");
    }

  }


}