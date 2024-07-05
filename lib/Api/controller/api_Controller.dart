import 'dart:convert';

import 'package:api_testing/Api/Utils/appURL.dart';
import 'package:api_testing/Api/model/PostGetModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController{
  Rx<TextEditingController> userIdController=TextEditingController().obs;
  Rx<TextEditingController> idController=TextEditingController().obs;
  Rx<TextEditingController> titleController=TextEditingController().obs;
  Rx<TextEditingController> bodyController=TextEditingController().obs;
  List<Postgetmodel> postList = [];


  Future<List<Postgetmodel>> FetchData() async{
    final url=Uri.parse(appURL.getPostURL);
    final response = await http.get(url);
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(Postgetmodel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }

  void getRegister(String userId, String id, String title, String body) async {
    try{
      final url=Uri.parse(appURL.postURL);
      Map request = {
        "userId":userId,
        "id":id,
        "title":title,
        "body":body,
      };
      final resposne = await http.post(url,body:request);
      print(resposne);
      if(resposne.statusCode==201){
        var jsonResponse=json.decode(resposne.body.toString());
        print("Status = ${jsonResponse['status']}");
        print("Register Success");
      }else{
        print("Failed to load post");
      }
    }catch(e){
      throw Exception("Failed to Load post");
    }
  }


   Future<Postgetmodel> getUpdate(String userId, String id, String title, String body) async{
    try{
      final url=Uri.parse(appURL.puttURL);
      Map request={
        "userId":userId,
        "id":id,
        "title":title,
        "body":body,
      };
      final response=await http.put(url, body: request);
      if(response.statusCode==200){
        return Postgetmodel.fromJson(json.decode(response.body));
        print(update);
        print("Update Sccess");
      }else{
        throw Exception("Update Failed");
        print("Update Failed");
      }

    }catch(e){
      throw Exception("Failed to load albams");
    }
  }

  Future<Postgetmodel> getUpdateToShow() async{
      final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com//posts/1'));
      if(response.statusCode==200){
        return Postgetmodel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Failed to fetch");
      }
  }


  Future<Postgetmodel> getDelete(String id) async{

      final url=Uri.parse('https://jsonplaceholder.typicode.com//posts/$id');
      final response= await http.delete(url);

      if (response.statusCode == 200) {
        print("deleted");
        return Postgetmodel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to delete album.');
      }
  }



}