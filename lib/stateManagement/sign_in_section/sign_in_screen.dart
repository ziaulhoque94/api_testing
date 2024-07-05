import 'package:api_testing/stateManagement/sign_in_section/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class sign_in_screen extends StatefulWidget {
  const sign_in_screen({super.key});

  @override
  State<sign_in_screen> createState() => _sign_in_screenState();
}

class _sign_in_screenState extends State<sign_in_screen> {

  sign_in_controller _controller=Get.put(sign_in_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller.emalController.value,
                decoration: InputDecoration(
                  labelText: 'Enter email'
                ),
              ),
              TextField(
                controller: _controller.passwordController.value,
                decoration: InputDecoration(
                    labelText: 'Enter email'
                ),
              ),

              ElevatedButton(onPressed: () {

                _controller.sign_in_method(_controller.emalController.value.text.toString(),
                    _controller.passwordController.value.toString());

              }, child: Text("Sign In"))


            ],
          ),
        ),
      ),
    );
  }
}
