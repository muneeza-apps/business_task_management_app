import 'package:flutter/material.dart';

class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.title,
    required this.child,
    this.floatingActionButton,
    this.maxContentWidth = 1120,
    this.padding = const EdgeInsets.fromLTRB(20, 12, 20, 32),
  });

  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}
