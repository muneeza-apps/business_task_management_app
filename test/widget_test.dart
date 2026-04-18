import 'package:business_task_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows login screen on launch', (WidgetTester tester) async {
    await tester.pumpWidget(const BusinessTaskManagementApp());

    expect(find.text('Business Task Manager'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('navigates from login to home after valid form submit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BusinessTaskManagementApp());

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'admin@company.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.ensureVisible(find.text('Login'));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Business Dashboard'), findsOneWidget);
    expect(find.text('Good Morning, Admin'), findsOneWidget);
  });
}
