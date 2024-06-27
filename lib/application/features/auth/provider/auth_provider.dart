import 'package:amirtha_ayurveda/application/core/const/const_value.dart';
import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:amirtha_ayurveda/application/features/patient_list/ui/patient_list.dart';
import 'package:amirtha_ayurveda/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';
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

  Future<void> goTologin(
      {required String username,
      required String password,
      required BuildContext context}) async {
    return AuthUseCase()
        .login(username: username, password: password, context: context);
  }
}
