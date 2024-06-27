
import 'package:amirtha_ayurveda/application/features/auth/ui/splash_screen.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/ui/register_page.dart';
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
      home: SplashScreen(),
    );
  }
}