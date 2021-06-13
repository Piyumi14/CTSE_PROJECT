import 'package:flutter/cupertino.dart';
import 'package:todo_app_firestore_example/utils.dart';

class StylesField {
  static const createdTime = 'createdTime';
}

class Styles {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Styles({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });

  static Styles fromJson(Map<String, dynamic> json) => Styles(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
