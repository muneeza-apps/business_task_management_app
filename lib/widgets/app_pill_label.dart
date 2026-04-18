import 'package:flutter/material.dart';

class AppPillLabel extends StatelessWidget {
  const AppPillLabel({
    super.key,
    required this.label,
    this.backgroundColor = const Color(0xFFEFF6FF),
    this.textColor = const Color(0xFF1E3A8A),
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
