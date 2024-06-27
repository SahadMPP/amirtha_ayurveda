import 'package:amirtha_ayurveda/application/core/const_value.dart';
import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:amirtha_ayurveda/application/features/patient_list/ui/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    goToLogin(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/main_images/Annotation 2024-06-26 192515.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  goToLogin(context) async {
    await Future.delayed(const Duration(seconds: 2));
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final bool? value = prefs.getBool(loginSharePreference);
   if (value == null || value == false ) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ));
   }else{
     Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const PatientListPage(),
    ));
   }

   
  }
}
