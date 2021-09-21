// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:dog_app_provider/app/login_provider.dart';
import 'package:dog_app_provider/service/entities/api_response.dart';
import 'package:dog_app_provider/service/entities/login_response.dart';
import 'package:dog_app_provider/service/login_service.dart';
import 'package:dog_app_provider/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockLoginService extends Mock implements LoginService {
  @override
  Future<LoginResponse> postLogin(String email, String password) async {
    return LoginResponse(token: '123456');
  }
}

void main() {
  MockLoginService? service;
  LoginProvider? loginProvider =
      LoginProvider(loginService: LoginService(Dio()));

  setUp(() {
    service = MockLoginService();
    service!.postLogin('', '');
  });
  Widget _makeTestable(Widget child) {
    return ChangeNotifierProvider<LoginProvider>.value(
      value: loginProvider,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  var emailField = find.byKey(const Key("email_form_field"));
  var passwordField = find.byKey(const Key("password_form_field"));
  var signInButton = find.text("Submit");

  group("login page test", () {
    testWidgets('email, password and button are found',
        (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestable(const Home()));
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(signInButton, findsOneWidget);
    });
    testWidgets("validates empty email and password",
        (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestable(const Home()));
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text("Please Enter Correct Email"), findsOneWidget);
      expect(find.text("Please Enter Correct Password"), findsOneWidget);
    });
  });
}
