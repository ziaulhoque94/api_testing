import 'package:api_testing/stateManagement/Post_section/post_screen.dart';
import 'package:api_testing/stateManagement/sign_in_section/sign_in_screen.dart';
import 'package:api_testing/stateManagement/sign_up_section/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Api/screem/DeleteScreen.dart';
import 'Api/screem/Post_screen.dart';
import 'Api/screem/RegisterScreen.dart';
import 'Api/screem/UpdateScreen.dart';
import 'Http_request/data_show_screen.dart';
import 'Http_request/http_req_screen.dart';
import 'authentication/sing_up_screen.dart';
import 'authentication/update_data.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const update_data(),
      // home: const sign_in_screen(),
      // home: const PostScreen(),
      // home: const http_req_screen(),
      // home: const data_show_screen(),
      // home: const Api_PostScreen(),
      // home: const Registerscreen(),
      // home: const Updatescreen(),
      home: const Deletescreen(),
    );
  }
}
