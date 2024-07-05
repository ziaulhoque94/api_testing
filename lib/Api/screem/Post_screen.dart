import 'dart:convert';

import 'package:api_testing/Api/Utils/appURL.dart';
import 'package:api_testing/Api/controller/api_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:api_testing/Api/model/PostGetModel.dart';

class Api_PostScreen extends StatefulWidget {
  const Api_PostScreen({super.key});

  @override
  State<Api_PostScreen> createState() => _Api_PostScreenState();
}

class _Api_PostScreenState extends State<Api_PostScreen> {

  final ApiController _controller = Get.put(ApiController());
    List<Postgetmodel> postList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _controller.FetchData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: _controller.postList.length,
                  itemBuilder: (context, index) {
                    return Card(
                    child: ListTile(
                      tileColor: Colors.green[300],
                      titleTextStyle:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                      subtitleTextStyle:const TextStyle(color: Colors.black, fontSize: 12),
                      leading: Text(snapshot.data![index].id.toString()),
                      title: Text("title ${snapshot.data![index].title}"),
                      subtitle: Text(snapshot.data![index].body.toString()),
                    ),
                    );
                  },
              );
            }
            return Center(child: const CircularProgressIndicator());
          },
      ),
    );
  }

  Future<List<Postgetmodel>> getData() async{
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
}
