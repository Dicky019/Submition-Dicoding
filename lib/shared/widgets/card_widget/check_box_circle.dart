import 'package:flutter/material.dart';

import '../../../task/model/model_task.dart';

class CheckBoxCircle extends StatefulWidget {
  final ModelTask model;
  final bool isFalseOntap;
  const CheckBoxCircle(
      {Key? key, required this.model, required this.isFalseOntap})
      : super(key: key);

  @override
  State<CheckBoxCircle> createState() => _CheckBoxCircleState();
}

class _CheckBoxCircleState extends State<CheckBoxCircle> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.black,
        value: widget.model.isDone,
        onChanged: widget.isFalseOntap
            ? null
            : (v) {
                widget.model.isDone = v ?? false;
                setState(() {});
              },
      ),
    );
  }
}