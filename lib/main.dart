
import 'package:amirtha_ayurveda/application/features/auth/provider/auth_provider.dart';
import 'package:amirtha_ayurveda/application/features/auth/ui/splash_screen.dart';
import 'package:amirtha_ayurveda/application/features/patient_list/provider/patient_list_provider.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => PatientListProvider(),),
        ChangeNotifierProvider(create: (context) => RegisterProvider(),)
       ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}