import 'package:api_testing/stateManagement/Post_section/post_controller.dart';
import 'package:api_testing/stateManagement/Post_section/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final post_controller _controller=Get.put(post_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _controller.getPost(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.done){

                if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }else if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: _controller.post_list.length,
                    itemBuilder: (context, index) {
                    return Card(elevation: 10,
                      color: Colors.green,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        hoverColor: Colors.green,
                        leading: CircleAvatar(child: Text(snapshot.data![index].id.toString())),
                        title: Text(snapshot.data![index].title.toString(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(snapshot.data![index].body.toString(),
                            style: TextStyle(fontSize: 10)
                        ),
                      ),
                    );
                    },
                  );
                }

              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            },
        ),
      ),
    );
  }
}
