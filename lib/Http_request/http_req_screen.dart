import 'package:api_testing/Http_request/controller.dart';
import 'package:api_testing/Http_request/model/create_post_model.dart';
import 'package:api_testing/stateManagement/Post_section/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class http_req_screen extends StatefulWidget {
  const http_req_screen({super.key});

  @override
  State<http_req_screen> createState() => _http_req_screenState();
}

class _http_req_screenState extends State<http_req_screen> {

  final http_controller _controller=Get.put(http_controller());

  late Future<Post_model?>? postModel;

  // void initState() {
  //   super.initState();
  //   postModel=_controller.fetchPosts();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("Http package"),
        ),
      ),

      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Post_model?>(
              future: postModel,
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const CircularProgressIndicator();
                  }else if(snapshot.connectionState==ConnectionState.none){
                    return const Center(child: Text("Please turn on internet..."),);
                  }else{
                    if(snapshot.hasData){

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(snapshot.data!.title.toString(), style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold
                            ),),
                          ),

                          Padding(
                            padding:const EdgeInsets.all(5.0),
                            child: Text(snapshot.data!.body.toString(),
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          TextField(
                            controller: _controller.titleController.value,
                            decoration: InputDecoration(
                                labelText: 'Enter title'
                            ),
                          ),
                          TextField(
                            controller: _controller.bodyController.value,
                            decoration: InputDecoration(
                                labelText: 'Enter title'
                            ),
                          ),

















                        ],
                      );


                    }else if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }else {
                      return Container();
                    }
                  }
                },
            ),

            //   below button seciton
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed:()=>clickGetButton(),
                child:const Text("Get Post"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed:()=>clickCreatePostButton(),
                child:const Text("Create post"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed:()=>clickUpdateButton(),
                child:const Text("Update"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed:()=>clickDeleteButton(),
                child:const Text("DELETE"),
              ),
            )



          ],
        ),
      ),

    );
  }


  void clickGetButton(){
    setState(() {
      // postModel=_controller.fetchPosts();
    });
  }
  void clickDeleteButton(){
    setState(() {
      postModel= _controller.deletePost();
    });
  }
  void clickCreatePostButton(){
    setState(() {
      postModel=_controller.createdPost(_controller.titleController.value.text.toString(),
          _controller.bodyController.value.text.toString());
    });
  }
  void clickUpdateButton(){
    setState(() {
      postModel=_controller.createdPost(_controller.titleController.value.text.toString(),
          _controller.bodyController.value.text.toString());
    });
  }

  Widget buildDataWidget(context, snapshot){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
          child: Text(snapshot.data?.title, style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold
          ),),

        ),
        Padding(
          padding:const EdgeInsets.all(8.0),
          child: Text(snapshot.data?.body,
          style: TextStyle(
            fontSize: 12
          ),),
        ),
        SizedBox(
          height: 10,
        ),

        TextField(
          controller: _controller.titleController.value,
          decoration: InputDecoration(
            labelText: 'Enter title'
          ),
        ),
        TextField(
          controller: _controller.bodyController.value,
          decoration: InputDecoration(
              labelText: 'Enter title'
          ),
        )


      ],
    );
  }

}
