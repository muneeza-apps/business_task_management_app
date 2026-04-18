import 'package:flutter/material.dart';

class AppSurfaceCard extends StatelessWidget {
  const AppSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.gradient,
    this.backgroundColor,
    this.border,
    this.boxShadow,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final Color? backgroundColor;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: gradient == null ? backgroundColor ?? Colors.white : null,
          gradient: gradient,
          borderRadius: borderRadius,
          border: border,
          boxShadow:
              boxShadow ??
              const <BoxShadow>[
                BoxShadow(
                  color: Color(0x120F172A),
                  blurRadius: 24,
                  offset: Offset(0, 14),
                ),
              ],
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
