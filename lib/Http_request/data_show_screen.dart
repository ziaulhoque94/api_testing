import 'package:api_testing/Http_request/model/create_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class data_show_screen extends StatefulWidget {
  const data_show_screen({super.key});

  @override
  State<data_show_screen> createState() => _data_show_screenState();
}

class _data_show_screenState extends State<data_show_screen> {
  final http_controller _controller=Get.put(http_controller());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchPosts(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasData){
          return ListView.builder(
            itemCount: _controller.postList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(snapshot.data![index].id.toString()),
                title: Text(snapshot.data![index].title.toString()),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: Colors.green),
        );
      },
    );
  }
}
