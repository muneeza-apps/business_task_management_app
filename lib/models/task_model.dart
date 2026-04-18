import 'package:business_task_managment_app/utils/date_formatter.dart';

class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.deadline,
    required this.status,
    this.priority,
  });

  final String id;
  final String title;
  final String description;
  final String assignedTo;
  final DateTime deadline;
  final String status;
  final String? priority;

  String get assignee => assignedTo;

  String get dueDate => DateFormatter.formatShortDate(deadline);

  bool get isDone => status == 'Done' || status == 'Completed';

  static List<TaskModel> get dummyTasks => <TaskModel>[
    TaskModel(
      id: 'task-001',
      title: 'Prepare weekly operations report',
      description:
          'Compile department updates and summarize weekly task delivery metrics.',
      assignedTo: 'Operations Team',
      deadline: DateTime(2026, 4, 19),
      status: 'In Progress',
      priority: 'High',
    ),
    TaskModel(
      id: 'task-002',
      title: 'Review client onboarding flow',
      description:
          'Check process gaps and identify friction points in onboarding steps.',
      assignedTo: 'Customer Success',
      deadline: DateTime(2026, 4, 20),
      status: 'To Do',
      priority: 'Medium',
    ),
    TaskModel(
      id: 'task-003',
      title: 'Approve Q2 resource plan',
      description:
          'Validate staffing allocations and sign off on department capacity needs.',
      assignedTo: 'Management',
      deadline: DateTime(2026, 4, 21),
      status: 'Done',
      priority: 'High',
    ),
    TaskModel(
      id: 'task-004',
      title: 'Finalize vendor compliance checklist',
      description:
          'Complete the final version of procurement and compliance requirements.',
      assignedTo: 'Procurement',
      deadline: DateTime(2026, 4, 22),
      status: 'Done',
      priority: 'Low',
    ),
    TaskModel(
      id: 'task-005',
      title: 'Update executive presentation deck',
      description:
          'Refresh strategy slides with latest numbers and quarterly priorities.',
      assignedTo: 'Strategy Team',
      deadline: DateTime(2026, 4, 23),
      status: 'In Progress',
      priority: 'High',
    ),
    TaskModel(
      id: 'task-006',
      title: 'Approve internal policy revisions',
      description:
          'Review the revised internal policy document before final circulation.',
      assignedTo: 'Admin Office',
      deadline: DateTime(2026, 4, 25),
      status: 'To Do',
      priority: 'Medium',
    ),
  ];
}
