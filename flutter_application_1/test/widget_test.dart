import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App boots to onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Upang Express'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('Get Started navigates to login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final Finder getStarted = find.byKey(const Key('get-started-button'));
    await tester.ensureVisible(getStarted);
    await tester.tap(getStarted);
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.byKey(const Key('go-to-signup-button')), findsOneWidget);
  });

  testWidgets('Login page opens signup page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final Finder getStarted = find.byKey(const Key('get-started-button'));
    await tester.ensureVisible(getStarted);
    await tester.tap(getStarted);
    await tester.pumpAndSettle();

    final Finder signUp = find.byKey(const Key('go-to-signup-button'));
    await tester.ensureVisible(signUp);
    await tester.tap(signUp);
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsWidgets);
    expect(find.byKey(const Key('back-to-login-button')), findsOneWidget);
  });

  testWidgets('User can sign up and log in with new credentials', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final Finder getStarted = find.byKey(const Key('get-started-button'));
    await tester.ensureVisible(getStarted);
    await tester.tap(getStarted);
    await tester.pumpAndSettle();

    final Finder signUp = find.byKey(const Key('go-to-signup-button'));
    await tester.ensureVisible(signUp);
    await tester.tap(signUp);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your full name'),
      'Jane Doe',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your email'),
      'jane@example.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your phone number'),
      '09123456789',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Create a password'),
      'securepass',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Re-enter your password'),
      'securepass',
    );
    final Finder createAccount = find.byKey(const Key('signup-submit-button'));
    await tester.ensureVisible(createAccount);
    await tester.tap(createAccount);
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your email'),
      'jane@example.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Enter your password'),
      'securepass',
    );
    final Finder login = find.byKey(const Key('login-submit-button'));
    await tester.ensureVisible(login);
    await tester.tap(login);
    await tester.pumpAndSettle();

    expect(find.text('Order your favorite food!'), findsOneWidget);
  });
}
