import 'package:flutter/material.dart';

import '../../data/static_data.dart';

class TaskListWidget extends StatefulWidget {
  // final PageController pageController;
  const TaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskListWidget> createState() => _TaskListState();
}

class _TaskListState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var i = 0; i < StaticData.taskListbool.length; i++)
          Material(
            color:
                StaticData.taskListbool[i] ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                setState(() {
                  StaticData.taskListbool =
                      StaticData.taskListbool.map((e) => e = false).toList();
                  StaticData.taskListbool[i] = true;
                  StaticData.pageController.jumpToPage(i);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                  vertical: 10,
                ),
                child: Text(
                  StaticData.taskListText[i],
                  style: TextStyle(
                    color: StaticData.taskListbool[i]
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
