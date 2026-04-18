import 'package:business_task_managment_app/models/task_model.dart';
import 'package:business_task_managment_app/utils/app_routes.dart';
import 'package:business_task_managment_app/widgets/app_page_scaffold.dart';
import 'package:business_task_managment_app/widgets/page_intro.dart';
import 'package:business_task_managment_app/widgets/summary_metric_card.dart';
import 'package:business_task_managment_app/widgets/task_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TaskModel> tasks = TaskModel.dummyTasks.take(5).toList();
    final int totalTasks = tasks.length;
    final int completedTasks = tasks.where((task) => task.isDone).length;
    final int pendingTasks = tasks.where((task) => !task.isDone).length;

    return AppPageScaffold(
      title: 'Business Dashboard',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addTask);
        },
        icon: const Icon(Icons.add_task_outlined),
        label: const Text('Add Task'),
      ),
      child: ListView(
        children: <Widget>[
          PageIntro(
            eyebrow: 'Overview',
            title: 'Good Morning, Admin',
            description:
                'Here is a quick overview of business tasks, team progress, and pending priorities.',
            isPrimary: true,
            actions: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.tasks);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1D4ED8),
                ),
                icon: const Icon(Icons.list_alt_rounded),
                label: const Text('View All Tasks'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addTask);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x40FFFFFF)),
                ),
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text('Create Task'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final List<Widget> cards = <Widget>[
                SummaryMetricCard(
                  title: 'Total Tasks',
                  value: totalTasks.toString(),
                  icon: Icons.assignment_outlined,
                ),
                SummaryMetricCard(
                  title: 'Completed Tasks',
                  value: completedTasks.toString(),
                  icon: Icons.task_alt_outlined,
                ),
                SummaryMetricCard(
                  title: 'Pending Tasks',
                  value: pendingTasks.toString(),
                  icon: Icons.pending_actions_outlined,
                ),
              ];

              if (constraints.maxWidth >= 900) {
                return Row(
                  children: <Widget>[
                    Expanded(child: cards[0]),
                    const SizedBox(width: 14),
                    Expanded(child: cards[1]),
                    const SizedBox(width: 14),
                    Expanded(child: cards[2]),
                  ],
                );
              }

              return Column(
                children: <Widget>[
                  cards[0],
                  const SizedBox(height: 14),
                  cards[1],
                  const SizedBox(height: 14),
                  cards[2],
                ],
              );
            },
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recent Tasks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${tasks.length} active items',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...tasks.map((TaskModel task) => TaskCard(task: task)),
        ],
      ),
    );
  }
}
