import 'package:flutter/cupertino.dart';

class Task {
  final String name;
  bool isDone;
  Task({@required this.name, this.isDone = false});

  factory  Task.fromjson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isDone: json['isDone'],
    );
  } 

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }
}
