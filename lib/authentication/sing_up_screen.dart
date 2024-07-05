import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class sing_up_screen extends StatefulWidget {
  const sing_up_screen({super.key});

  @override
  State<sing_up_screen> createState() => _sing_up_screenState();
}

class _sing_up_screenState extends State<sing_up_screen> {

  TextEditingController email_Controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();

  void singUpMethod(String email, String password) async{
    var baseURL='https://reqres.in/api/register';
  final response=await post(Uri.parse(baseURL),
  body:
      {
        'email':email,
        'password':password
      }
  );

  if(response.statusCode==200){
    var data=jsonDecode(response.body.toString());
    print(data['token']);
    print("Resgiter successful");
  }else{
    print("Register failed");
  }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            controller: email_Controller,
            decoration: InputDecoration(
              labelText: 'Enter Email'
            ),
          ),

          TextField(
            controller: password_controller,
            decoration: InputDecoration(
                labelText: 'Enter password'
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: CupertinoButton(child: Text("Sing Up"),
                onPressed: () {
              singUpMethod(email_Controller.text.toString(), password_controller.text.toString());
                },
            ),
          )

        ],
      ),
    );
  }
}
