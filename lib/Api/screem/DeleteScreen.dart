import 'package:api_testing/Api/controller/api_Controller.dart';
import 'package:api_testing/Api/model/PostGetModel.dart';
import 'package:api_testing/Http_request/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Deletescreen extends StatefulWidget {
  const Deletescreen({super.key});

  @override
  State<Deletescreen> createState() => _DeletescreenState();
}

class _DeletescreenState extends State<Deletescreen> {

  final ApiController _controller=Get.put(ApiController());
  late Future<Postgetmodel> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future=_controller.getUpdateToShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Card(
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Text("UserId : ${snapshot.data?.userId}"),
                  Text("id : ${snapshot.data?.id}"),
                  Container(color:Colors.red[100], child: Text("Title : ${snapshot.data?.title}")),
                  Container(color:Colors.yellow[100], child: Text("Body : ${snapshot.data?.body}")),

                  ElevatedButton(onPressed: () {
                    setState(() {
                      _future=_controller.getDelete("1");
                    });
                  }, child: Text("Deleted"))
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
