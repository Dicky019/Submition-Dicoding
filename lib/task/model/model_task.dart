import 'package:flutter/material.dart';

class ModelTask {
  final String title;
  final DateTime date;
  final TypeTask type;
  final String description;
  bool isDone;

  ModelTask({
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.isDone,
  });
}

class TypeTask {
  final String name;
  final Color color;

  TypeTask({
    required this.name,
    required this.color,
  });
}
