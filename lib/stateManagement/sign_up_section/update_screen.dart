import 'package:api_testing/stateManagement/sign_up_section/control_statement.dart';
import 'package:api_testing/stateManagement/sign_up_section/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class update_screen extends StatefulWidget {
  const update_screen({super.key});

  @override
  State<update_screen> createState() => _update_screenState();
}

class _update_screenState extends State<update_screen> {

  final update_control_statement _controller=Get.put(update_control_statement());
  late Future<model> _futureModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureModel=_controller.showData_st();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: FutureBuilder(
          future: _futureModel,
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.done){

              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.title),
                    TextField(
                      controller: _controller.titleController.value,
                      decoration: const InputDecoration(
                        labelText: 'Enter name'
                      ),
                    ),

                    ElevatedButton(
                        onPressed: () {
                         setState(() {
                           _futureModel=_controller.updatedata_st_method(_controller.titleController.value.text);
                         });
                        },
                        child: const Text("Update")
                    )

                  ],
                );
              }else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
            }
            return Center(
                child: const CircularProgressIndicator(backgroundColor: Colors.green,)
            );
          },
      ),
    );
  }
}
