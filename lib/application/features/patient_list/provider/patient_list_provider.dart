import 'dart:convert';

import 'package:amirtha_ayurveda/application/core/const_value.dart';
import 'package:amirtha_ayurveda/application/features/auth/ui/login_page.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/ui/register_page.dart';
import 'package:amirtha_ayurveda/domain/entities/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatientListProvider extends ChangeNotifier {



  Future<List<Patient>> fetchPatient() async {
    const String url = '$baseUrl$endPointPateintList';

    List<Patient> listOfPatient = [];

    try {
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization': 'Bearer $currentUeserToken'
      },);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody.containsKey('patient')) {
        final List<dynamic> patientsList = responseBody['patient'];
        return patientsList.map((json) => Patient.fromJson(json)).toList();
      } else {
        throw Exception('Patients data not found in the response');
      }
      } else {
        throw Exception('Failed to load patient data');
      }
    } catch (e) {
      debugPrint("error got like $e");
    }
    return listOfPatient;
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
