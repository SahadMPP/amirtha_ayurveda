
import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}