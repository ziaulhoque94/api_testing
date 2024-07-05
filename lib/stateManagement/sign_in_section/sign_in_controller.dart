import 'dart:convert';

import 'package:api_testing/stateManagement/sign_in_section/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class sign_in_controller extends GetxController{
  Rx<TextEditingController> emalController=TextEditingController().obs;
  Rx<TextEditingController> passwordController=TextEditingController().obs;


  void sign_in_method(String email, String password) async{
    try{
      final response=await post(Uri.parse(appURL.sign_in_URL),
          // headers: <String, String>{
          //   'content-type':'application/json; charset=UTF-8'
          // },
          body:
          {
            'email':email,
            'password':password
          }
      );
      print(response);

      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data['token']);
        print("Login Success");
      }else{
        print("Login failed");
      }

    }catch(e){
      throw Exception(e.toString());
    }
  }

}