import 'dart:convert';

import 'package:api_testing/authentication/model/update_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class update_data extends StatefulWidget {
  const update_data({super.key});

  @override
  State<update_data> createState() => _update_dataState();
}

class _update_dataState extends State<update_data> {

  Future<update_model> updateMethod(String title) async{
    final response = await http.put(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, String>{
        'title': title,
      }) ,
    );


    if(response.statusCode==200){
      return update_model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to update data");
    }

  }

  Future<update_model> fetch_data() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if(response.statusCode==200){
      return update_model.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to fetch");
    }
  }

final TextEditingController titleCon=TextEditingController();
  late Future<update_model> _future_update_data;

  @override
  void initState() {
    super.initState();
    _future_update_data=fetch_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: _future_update_data,
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.title),

                      TextField(
                        controller: titleCon,
                        decoration: const InputDecoration(
                           hintText: 'Enter title'
                        ),
                      ),

                      ElevatedButton(onPressed: () {

                        setState(() {
                          _future_update_data=updateMethod(titleCon.text);
                        });

                      }, child: const Text("Update Data"))
                    ],
                  );

                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
              }
              return const CircularProgressIndicator();
            },
        ),
      ),
    );
  }
}

