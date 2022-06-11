import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/home/home_view.dart';

import '../data/static_data.dart';
import '../shared/widgets/button_widget.dart';
import 'widgets/list_type_widget.dart';
import 'widgets/task_detail_info_widget.dart';

class DetailTaskView extends StatefulWidget {
  final int index;
  const DetailTaskView({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailTaskView> createState() => _DetailTaskViewState();
}

class _DetailTaskViewState extends State<DetailTaskView> {
  @override
  Widget build(BuildContext context) {
    var data = StaticData.listData[widget.index];
    final size = MediaQuery.of(context).size;
    final title = data.title;
    final deadline =
        "${data.date.day} ${StaticData.dateMonth[data.date.month - 1]} ${data.date.year}, ${data.date.hour}:${data.date.minute}";
    final description = data.description;
    final type = data.type.color == Colors.pinkAccent
        ? [false, false, true]
        : data.type.color == Colors.yellowAccent
            ? [false, true, false]
            : [true, false, false];

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.back,
              ),
            ),
            title: const Text("Detail Task"),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskDetailInfoWidget(
                  title: "My Task",
                  description: title,
                ),
                TaskDetailInfoWidget(
                  title: "Deadline",
                  description: deadline,
                ),
                TaskDetailInfoWidget(
                  title: "Description",
                  description: description,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Task Type",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListTypeWidget(
                  type: type,
                  listTypeName: StaticData.typeTask,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Task Type",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.black,
                  value: StaticData.listData[widget.index].isDone,
                  contentPadding: const EdgeInsets.all(0),
                  onChanged: (value) {
                    StaticData.listData[widget.index].isDone =
                        !StaticData.listData[widget.index].isDone;
                    setState(() {});
                  },
                  title: const Text(
                    "Is Task Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        size: size,
                        title: "Hapus Task",
                        onPressed: () {},
                        isBorder: true,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ButtonWidget(
                        size: size,
                        title: "Edit Task",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




