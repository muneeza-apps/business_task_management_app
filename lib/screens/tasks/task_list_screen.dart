import 'package:business_task_managment_app/models/task_model.dart';
import 'package:business_task_managment_app/utils/app_routes.dart';
import 'package:business_task_managment_app/widgets/app_page_scaffold.dart';
import 'package:business_task_managment_app/widgets/page_intro.dart';
import 'package:business_task_managment_app/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TaskModel> tasks = TaskModel.dummyTasks;

    return AppPageScaffold(
      title: 'All Tasks',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addTask);
        },
        child: const Icon(Icons.add),
      ),
      child: ListView(
        children: <Widget>[
          PageIntro(
            title: 'Task Overview',
            description:
                'Track assignments, deadlines, and current progress across the business.',
            footer: Text(
              '${tasks.length} tasks in workspace',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 24),
          ...tasks.map(
            (TaskModel task) => TaskCard(task: task, showPriority: false),
          ),
        ],
      ),
    );
  }
}
