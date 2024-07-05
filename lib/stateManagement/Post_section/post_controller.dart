import 'dart:convert';

import 'package:api_testing/stateManagement/Post_section/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class post_controller extends GetxController{

  List<post_model> post_list=[];

  Future<List<post_model>> getPost() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      // data jate bar bar add na hoy tar jonno
      post_list.clear();
      for(Map i in data){
        post_list.add(post_model.fromJson(i));
      }
      return post_list;
    }else{
      return post_list;
    }

  }
}