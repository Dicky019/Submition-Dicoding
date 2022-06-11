import 'package:flutter/material.dart';

class TaskDetailInfoWidget extends StatelessWidget {
  final String title, description;
  const TaskDetailInfoWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}