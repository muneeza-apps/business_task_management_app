import 'package:business_task_managment_app/screens/home/home_screen.dart';
import 'package:business_task_managment_app/screens/login/login_screen.dart';
import 'package:business_task_managment_app/screens/tasks/add_task_screen.dart';
import 'package:business_task_managment_app/screens/tasks/task_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String tasks = '/tasks';
  static const String addTask = '/tasks/add';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      login => const LoginScreen(),
      home => const HomeScreen(),
      tasks => const TaskListScreen(),
      addTask => const AddTaskScreen(),
      _ => const LoginScreen(),
    };

    return PageRouteBuilder<void>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Animation<Offset> offsetAnimation =
            Tween<Offset>(
              begin: const Offset(0.02, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 220),
    );
  }
}
