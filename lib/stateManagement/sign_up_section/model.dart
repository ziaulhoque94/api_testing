import 'package:flutter/foundation.dart';

class model{
  final int id;
  final String title;

  model({required this.id, required this.title});


  // factory update_model.fromJson(Map<String, dynamic> json) {
  //   return update_model(
  //     id: json['id'],
  //     title: json['title'],
  //   );
  // }

  factory model.fromJson(Map<String, dynamic> json){
    return model(id: json['id'], title: json['title']);
  }


}