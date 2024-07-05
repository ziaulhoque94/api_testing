import 'dart:convert';

import 'package:api_testing/stateManagement/sign_up_section/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:api_testing/stateManagement/sign_up_section/utilis.dart';


class update_control_statement extends GetxController{
  Rx<TextEditingController> idController=TextEditingController().obs;
  Rx<TextEditingController> titleController=TextEditingController().obs;


  Future<model> updatedata_st_method(String title) async{

    final response=await http.put(Uri.parse(appurl.signUp_URL),
      headers: <String, String>{
      'content-type':'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String> {
        'title':title
      })
    );

    if(response.statusCode==200){
      return model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Update failed...");
    }
  }

  Future<model> showData_st() async{
    final response=await http.get(Uri.parse(appurl.signUp_URL));

    if(response.statusCode==200){
      return model.fromJson(json.decode((response.body)));
    }else{
      throw Exception("Failed to fetch");
    }
  }



}