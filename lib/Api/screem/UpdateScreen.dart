import 'package:api_testing/Api/controller/api_Controller.dart';
import 'package:api_testing/Api/model/PostGetModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Updatescreen extends StatefulWidget {
  const Updatescreen({super.key});

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {

  final ApiController _controller=Get.put(ApiController());

  late Future<Postgetmodel> _futureModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureModel=_controller.getUpdateToShow();
  }

  @override
  Widget build(BuildContext context) {
   var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            width: width * 0.80,
            height: height * 0.10,
            child: TextFormField(
              controller: _controller.userIdController.value,
              decoration: InputDecoration(
                  labelText: 'Enter userId',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)
                  )
              ),
            ),
          ),
          SizedBox(
            width: width * 0.80,
            height: height * 0.10,
            child: TextFormField(
              controller: _controller.idController.value,
              decoration: InputDecoration(
                  labelText: 'Enter id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)
                  )
              ),
            ),
          ),
          SizedBox(
            width: width * 0.80,
            height: height * 0.10,
            child: TextFormField(
              controller: _controller.titleController.value,
              decoration: InputDecoration(
                  labelText: 'Enter Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)
                  )
              ),
            ),
          ),
          SizedBox(
            width: width * 0.80,
            height: height * 0.10,
            child: TextFormField(
              controller: _controller.bodyController.value,
              decoration: InputDecoration(
                  labelText: 'Enter description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)
                  )
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {

                setState(() {
                  // _updateToShowModel=_controller.getUpdate(id, title, body);
                 _futureModel= _controller.getUpdate(
                     _controller.userIdController.value.text.toString(),
                      _controller.idController.value.text.toString(),
                      _controller.titleController.value.text.toString(),
                      _controller.bodyController.value.text.toString()
                  );

                  // _futureModel=_controller.getUpdate(id, title, body);

                });

              },
              child: Text("Update"),
            ),
          ),



          Center(
            child: FutureBuilder(
                future: _futureModel,
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
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
            ),
          )





        ],
      ),
    );
  }
}
