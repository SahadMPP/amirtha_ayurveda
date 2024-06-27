import 'dart:convert';

import 'package:amirtha_ayurveda/application/core/const/const_value.dart';
import 'package:amirtha_ayurveda/data/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class PatientListRemoteDatesource {
  Future<List<PatientModel>> fetchPatient();
}

class PatientListRemoteDatesourceImpli extends PatientListRemoteDatesource {
  @override
  Future<List<PatientModel>> fetchPatient() async{
     const String url = '$baseUrl$endPointPateintList';

    List<PatientModel> listOfPatient = [];

    try {
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization': 'Bearer $currentUeserToken'
      },);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody.containsKey('patient')) {
        final List<dynamic> patientsList = responseBody['patient'];
        return patientsList.map((json) => PatientModel.fromJson(json)).toList();
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
  
}