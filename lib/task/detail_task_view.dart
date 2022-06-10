import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/home/home_view.dart';

import '../data/static_data.dart';

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
    final type = data.color == Colors.pinkAccent
        ? [false, false, true]
        : data.color == Colors.yellowAccent
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
                taskDetailWidget("My Task", title),
                taskDetailWidget("Deadline", deadline),
                taskDetailWidget("Description", description),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listTypeWidget(type),
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
                    detailTaskButton(size, "Hapus Task", () {}, isBorder: true),
                    const SizedBox(
                      width: 16,
                    ),
                    detailTaskButton(size, "Edit Task", () {}),
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

  Expanded detailTaskButton(Size size, String title, VoidCallback onPressed,
      {bool isBorder = false}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          primary: isBorder ? Colors.transparent : Colors.black,
          // shadowColor: Colors.transparent,
          elevation: 0,
          minimumSize: Size(
            size.width,
            50,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isBorder ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Material> listTypeWidget(List<bool> type) {
    return List.generate(type.length, (index) {
      final listTypeName = ["Basic", "Urgent", "Important"];
      return Material(
        color: type[index] ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 34,
              vertical: 10,
            ),
            child: Text(
              listTypeName[index],
              style: TextStyle(
                color: type[index] ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );
    });
  }

  Column taskDetailWidget(String title, String description) {
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

  Container iconButtonCircle(
    IconData iconButton,
    VoidCallback onPressed,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        splashRadius: 0.1,
        icon: Icon(iconButton),
        onPressed: onPressed,
      ),
    );
  }
}
