import 'package:flutter/material.dart';
import 'package:proyek_akhir/data/static_data.dart';
import 'widgets/list_task_widget.dart';
import '../task/widgets/task_body_widget.dart';
import 'widgets/welcome_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Task Manager'),
          ),
          body: Column(
            children: [
              const WelcomeWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                child: TaskListWidget(),
              ),
              Expanded(
                child: PageView.builder(
                  controller: StaticData.pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      StaticData.listData = StaticData.dataTaskToday;
                    } else if (i == 1) {
                      StaticData.listData = StaticData.dataTaskUpcoming;
                    } else if (i == 2) {
                      StaticData.listData = StaticData.dataTaskTaskDone;
                    }
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: StaticData.taskListbool.length,
                  itemBuilder: (contex, i) {
                    return TaskBodyWidget(
                      isFalseOntap: i == StaticData.taskListbool.length - 1,
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
