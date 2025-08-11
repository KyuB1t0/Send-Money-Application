// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_application/data/logic/session_bloc/session_bloc.dart';

import 'package:send_money_application/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App renders initial UI', (WidgetTester tester) async {
    // Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    // Create a mock SessionState
    final sessionState =
        SessionState(prefs)
          ..token = 'dummyToken'
          ..loggedIn = true; // if those fields exist

    await tester.pumpWidget(MyApp(loginState: sessionState));
    await tester.pumpAndSettle();

    // Verify something from your actual UI
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
