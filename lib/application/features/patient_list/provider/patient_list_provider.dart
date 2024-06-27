import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/ui/register_page.dart';
import 'package:amirtha_ayurveda/domain/entities/patient_entitie.dart';
import 'package:amirtha_ayurveda/domain/usecases/patient_list_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListProvider extends ChangeNotifier {

  Future<List<Patient>> fetchPatient()async{
    return PatientListUseCase().feachingPatientIndataBase();
  }

  logOut(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure to logOut?"),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ));
  }

  goToRegisterPage(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RegisterPage(),
    ));
  }

  searchPatientList() {}
}
