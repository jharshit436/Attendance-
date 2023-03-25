import 'package:attendance_tracker/pages/auth_page.dart';
import 'package:attendance_tracker/pages/dashboard.dart';
import 'package:attendance_tracker/pages/profile.dart';
import 'package:attendance_tracker/pages/splash_screen.dart';
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
      routes: {
        '/': (context) => SplashScreen(),
        '/splash': (context) => SplashScreen(),
        '/Authlogin': (context) => const LoginPage(),
        '/AuthsignUp': (context) => const SignUpPage(),
        '/Dashboard': (context) => const Dashboard(),
        '/Profile': (context) => const Profile(),
      },
    );
  }
}
