
import 'package:attendance_tracker/pages/auth_page.dart';
import 'package:attendance_tracker/pages/dashboard.dart';
import 'package:attendance_tracker/pages/splash_screen.dart';
import 'package:attendance_tracker/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      routes: {
        '/': (context) => SplashScreen(),
        '/splash': (context) => SplashScreen(),
        'Authlogin': (context) => LoginPage(),
        '/AuthsignUp': (context) => SignUpPage(),
        '/Dashboard': (context) => Dashboard(),
      },
    );
  }
}
