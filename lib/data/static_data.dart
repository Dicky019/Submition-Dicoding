import 'package:flutter/material.dart';
import 'package:proyek_akhir/task/model/model_task.dart';

class StaticData {
  static final pageController = PageController();

  static var taskListbool = [
    true,
    false,
    false,
  ];
  static const taskListText = [
    "Today",
    "Upcoming",
    "Task Done",
  ];

  static const dateMonth = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  static final dataTask = [
    ModelTask(
      title: "Homework",
      description: "Tugas Praktikum Pemrograman Mobile",
      date: DateTime.now(),
      color: Colors.pinkAccent,
      isDone: false,
    ),
    ModelTask(
      title: "Learn",
      description: "Belajar Mendekorasi Container Flutter",
      date: DateTime.now(),
      color: Colors.blueAccent,
      isDone: true,
    ),
    ModelTask(
      title: "Meeting",
      description: "Meeting dengan teman",
      date: DateTime.now(),
      color: Colors.yellowAccent,
      isDone: false,
    ),
    ModelTask(
      title: "Learn",
      description: "Belajar Dart OOP",
      date: DateTime(2022, 6, 20, 22, 15),
      color: Colors.blueAccent,
      isDone: false,
    ),
    ModelTask(
      title: "Homework",
      description: "Tugas Praktikum Pemrograman Web",
      date: DateTime(2022, 6, 19, 22, 15),
      color: Colors.pinkAccent,
      isDone: false,
    ),
    ModelTask(
      title: "Meeting",
      description: "Meeting dengan teman",
      date: DateTime(2022, 6, 18, 22, 15),
      color: Colors.yellowAccent,
      isDone: false,
    ),
    ModelTask(
      title: "Meeting",
      description: "Meeting dengan teman",
      date: DateTime(2022, 6, 17, 22, 15),
      color: Colors.yellowAccent,
      isDone: false,
    ),
  ];

  static List<ModelTask> get dataTaskToday {
    var date = DateTime.now();
    return dataTask
        .where((element) =>
            "${element.date.year}-${element.date.month}-${element.date.day}" ==
            "${date.year}-${date.month}-${date.day}")
        .toList();
  }

  static List<ModelTask> get dataTaskUpcoming {
    var data = dataTask
        .where((element) => element.date.isAfter(DateTime.now()))
        .toList();
        data.sort((a, b) => a.date.compareTo(b.date));
    return data;
  }

  static List<ModelTask> get dataTaskTaskDone {
    return dataTask.where((element) => element.isDone).toList();
  }

  static var listData = StaticData.dataTaskToday;
}
