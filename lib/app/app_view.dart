import 'package:flutter/material.dart';
import 'package:with_tft/login/view/login_view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black, // 검정
        scaffoldBackgroundColor: Colors.white, // 흰색
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      home: const LoginView(),
    );
  }
}
