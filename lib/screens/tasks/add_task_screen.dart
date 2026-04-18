import 'package:business_task_managment_app/utils/date_formatter.dart';
import 'package:business_task_managment_app/widgets/app_page_scaffold.dart';
import 'package:business_task_managment_app/widgets/app_surface_card.dart';
import 'package:business_task_managment_app/widgets/page_intro.dart';
import 'package:business_task_managment_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _teamMembers = <String>[
    'Sarah Khan',
    'Adeel Ahmed',
    'Hina Malik',
    'Operations Team',
    'Admin Office',
  ];

  String? _selectedAssignee = 'Sarah Khan';
  String _selectedPriority = 'Medium';
  String _deadlineLabel = 'Select deadline';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDeadline() async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (pickedDate == null) {
      return;
    }

    setState(() {
      _deadlineLabel = DateFormatter.formatShortDate(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Add Task',
      maxContentWidth: 760,
      child: ListView(
        children: <Widget>[
          PageIntro(
            eyebrow: 'Task Workspace',
            title: 'Create New Task',
            description:
                'Set up a new business task with ownership, deadline, and priority details.',
          ),
          const SizedBox(height: 24),
          AppSurfaceCard(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _FormSectionLabel(label: 'Task Title'),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _titleController,
                  label: 'Task Title',
                  hintText: 'Enter task title',
                  prefixIcon: Icons.title_rounded,
                ),
                const SizedBox(height: 22),
                _FormSectionLabel(label: 'Task Description'),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _descriptionController,
                  label: 'Task Description',
                  hintText: 'Add a short description for this task',
                  prefixIcon: Icons.notes_rounded,
                  maxLines: 5,
                  minLines: 5,
                  alignLabelWithHint: true,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 22),
                _FormSectionLabel(label: 'Assign To'),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  initialValue: _selectedAssignee,
                  items: _teamMembers
                      .map(
                        (String member) => DropdownMenuItem<String>(
                          value: member,
                          child: Text(member),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAssignee = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Assign To',
                    hintText: 'Select assignee',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 22),
                _FormSectionLabel(label: 'Deadline'),
                const SizedBox(height: 10),
                _DatePickerField(label: _deadlineLabel, onTap: _pickDeadline),
                const SizedBox(height: 22),
                _FormSectionLabel(label: 'Priority'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                    _PriorityChip(
                      label: 'High',
                      selected: _selectedPriority == 'High',
                      onSelected: () {
                        setState(() {
                          _selectedPriority = 'High';
                        });
                      },
                    ),
                    _PriorityChip(
                      label: 'Medium',
                      selected: _selectedPriority == 'Medium',
                      onSelected: () {
                        setState(() {
                          _selectedPriority = 'Medium';
                        });
                      },
                    ),
                    _PriorityChip(
                      label: 'Low',
                      selected: _selectedPriority == 'Low',
                      onSelected: () {
                        setState(() {
                          _selectedPriority = 'Low';
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create Task'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormSectionLabel extends StatelessWidget {
  const _FormSectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: const Color(0xFF0F172A)),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFD8E1EE)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: label == 'Select deadline'
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF0F172A),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF64748B),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  const _PriorityChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2563EB) : const Color(0xFFEFF6FF),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? const Color(0xFF2563EB) : const Color(0xFFD8E1EE),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF334155),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
