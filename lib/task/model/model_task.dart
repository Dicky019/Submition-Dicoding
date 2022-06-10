import 'package:flutter/material.dart';

class ModelTask {
  final String title;
  final DateTime date;
  final Color color;
  final String description;
  bool isDone;

  ModelTask({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
    required this.isDone,
  });
}
