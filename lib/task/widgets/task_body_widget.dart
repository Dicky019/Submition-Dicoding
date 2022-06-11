import 'package:flutter/material.dart';
import '../../data/static_data.dart';
import '../../shared/widgets/card_widget/card_widget.dart';

class TaskBodyWidget extends StatelessWidget {
  final bool isFalseOntap;
  const TaskBodyWidget({
    Key? key, required this.isFalseOntap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CardTask(
          index: index,
          isFalseOntap : isFalseOntap
        );
      },
      itemCount: StaticData.listData.length,
    );
  }
}