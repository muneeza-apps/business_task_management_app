import 'package:business_task_managment_app/widgets/app_pill_label.dart';
import 'package:business_task_managment_app/widgets/app_surface_card.dart';
import 'package:flutter/material.dart';

class PageIntro extends StatelessWidget {
  const PageIntro({
    super.key,
    required this.title,
    required this.description,
    this.eyebrow,
    this.footer,
    this.actions,
    this.isPrimary = false,
  });

  final String title;
  final String description;
  final String? eyebrow;
  final Widget? footer;
  final List<Widget>? actions;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final Color titleColor = isPrimary ? Colors.white : const Color(0xFF0F172A);
    final Color descriptionColor = isPrimary
        ? const Color(0xDBEFF6FF)
        : const Color(0xFF475569);

    return AppSurfaceCard(
      padding: const EdgeInsets.all(28),
      gradient: isPrimary
          ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF2563EB), Color(0xFF1D4ED8)],
            )
          : null,
      backgroundColor: Colors.white,
      border: isPrimary ? null : Border.all(color: const Color(0xFFE2E8F0)),
      boxShadow: isPrimary
          ? const <BoxShadow>[
              BoxShadow(
                color: Color(0x1F2563EB),
                blurRadius: 28,
                offset: Offset(0, 18),
              ),
            ]
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (eyebrow != null) ...<Widget>[
            AppPillLabel(
              label: eyebrow!,
              backgroundColor: isPrimary
                  ? const Color(0x26FFFFFF)
                  : const Color(0xFFEFF6FF),
              textColor: isPrimary ? Colors.white : const Color(0xFF1E3A8A),
            ),
            const SizedBox(height: 20),
          ],
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: titleColor),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: descriptionColor),
          ),
          if (actions != null && actions!.isNotEmpty) ...<Widget>[
            const SizedBox(height: 24),
            Wrap(spacing: 12, runSpacing: 12, children: actions!),
          ],
          if (footer != null) ...<Widget>[const SizedBox(height: 18), footer!],
        ],
      ),
    );
  }
}
