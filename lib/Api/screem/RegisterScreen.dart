import 'package:api_testing/Api/controller/api_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final ApiController _controller=Get.put(ApiController());

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
                labelText: 'Enter UserID',
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
                _controller.getRegister(
                    _controller.userIdController.value.text.toString(),
                    _controller.idController.value.text.toString(),
                    _controller.titleController.value.text.toString(),
                    _controller.bodyController.value.text.toString()
                );
              },
              child: Text("Register"),
            ),
          )


        ],
      ),
    );
  }
}
