import 'package:business_task_managment_app/models/task_model.dart';
import 'package:business_task_managment_app/widgets/app_surface_card.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.showPriority = true,
    this.bottomSpacing = 16,
  });

  final TaskModel task;
  final bool showPriority;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpacing),
      child: AppSurfaceCard(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        task.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                TaskStatusBadge(status: task.status),
              ],
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: <Widget>[
                TaskMetaItem(
                  icon: Icons.person_outline_rounded,
                  label: task.assignee,
                ),
                if (showPriority)
                  TaskMetaItem(
                    icon: Icons.flag_outlined,
                    label: 'Priority: ${task.priority ?? 'Not set'}',
                  ),
                TaskMetaItem(
                  icon: Icons.schedule_outlined,
                  label: task.dueDate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStatusBadge extends StatelessWidget {
  const TaskStatusBadge({super.key, required this.status});

  final String status;

  Color get _textColor {
    switch (status) {
      case 'Done':
        return const Color(0xFF166534);
      case 'In Progress':
        return const Color(0xFF1D4ED8);
      case 'To Do':
        return const Color(0xFF92400E);
      default:
        return const Color(0xFF0F172A);
    }
  }

  Color get _backgroundColor {
    switch (status) {
      case 'Done':
        return const Color(0xFFDCFCE7);
      case 'In Progress':
        return const Color(0xFFDBEAFE);
      case 'To Do':
        return const Color(0xFFFEF3C7);
      default:
        return const Color(0xFFE2E8F0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _textColor,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TaskMetaItem extends StatelessWidget {
  const TaskMetaItem({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 16, color: const Color(0xFF64748B)),
        ),
        const SizedBox(width: 10),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
