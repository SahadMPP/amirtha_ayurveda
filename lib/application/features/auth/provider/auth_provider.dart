import 'dart:convert';

import 'package:amirtha_ayurveda/application/core/const_value.dart';
import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:amirtha_ayurveda/application/features/patient_list/ui/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


  Future<void> spleshScreenPageDivider(context) async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? value = prefs.getBool(loginSharePreference);
    if (value == null || value == false) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const PatientListPage(),
      ));
    }
  }

  goTologin({required String username, required String password,required BuildContext context}) async {
    const String url = '$baseUrl$endPointLogin';
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final String token = responseBody['token'];
        debugPrint('Token: $token');
        currentUeserToken = token;
         final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(loginSharePreference, true);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const PatientListPage(),
                  ),
                  (route) => false);
      } else {
        emailController.text = '';
        passwordController.text = '';
        debugPrint('Login failed with status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
    }
  }
}
