import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/task/detail_task_view.dart';

import '../../data/static_data.dart';
import '../model/model_task.dart';

class CardTask extends StatefulWidget {
  final int index;
  final bool isFalseOntap;
  const CardTask({Key? key, required this.index, required this.isFalseOntap})
      : super(key: key);

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: StaticData.listData[widget.index].color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onLongPress: widget.isFalseOntap
            ? null
            : () {
                StaticData.listData[widget.index].isDone = !StaticData.listData[widget.index].isDone;
                setState(() {});
              },
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DetailTaskView(
                index: widget.index,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StaticData.listData[widget.index].title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTimeWidget(
                      icon: CupertinoIcons.calendar,
                      date:
                          "${StaticData.listData[widget.index].date.day} ${StaticData.dateMonth[StaticData.listData[widget.index].date.month - 1]} ${StaticData.listData[widget.index].date.year}",
                    ),
                    const SizedBox(height: 2),
                    IconTimeWidget(
                      date:
                          '${StaticData.listData[widget.index].date.hour}:${StaticData.listData[widget.index].date.minute}',
                      icon: CupertinoIcons.clock,
                    ),
                  ],
                ),
                CheckBoxCircle(model: StaticData.listData[widget.index], isFalseOntap: widget.isFalseOntap)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class CheckBoxCircle extends StatefulWidget {
  final ModelTask model;
  final bool isFalseOntap;
  const CheckBoxCircle({Key? key, required this.model, required this.isFalseOntap}) : super(key: key);

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

class IconTimeWidget extends StatelessWidget {
  const IconTimeWidget({
    Key? key,
    required this.date,
    required this.icon,
  }) : super(key: key);

  final String date;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          date,
        ),
      ],
    );
  }
}
