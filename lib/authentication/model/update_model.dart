import 'package:flutter/foundation.dart';

class update_model{
  final int id;
  final String title;

  update_model({required this.id, required this.title});


  // factory update_model.fromJson(Map<String, dynamic> json) {
  //   return update_model(
  //     id: json['id'],
  //     title: json['title'],
  //   );
  // }

factory update_model.fromJson(Map<String, dynamic> json){
  return update_model(id: json['id'], title: json['title']);
}


}