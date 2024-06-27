
import 'dart:convert';

import 'package:amirtha_ayurveda/application/core/const_value.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  saveDate() {}

  addTreatment() {}

  Future<List<Branch>> feachingBranch() async {
    List<Branch> branchList = [];

    const String url = '$baseUrl$endPointBranchList';
    try {
      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $currentUeserToken'});

      if (response.statusCode == 200) {
         final Map<String, dynamic> responseBody = json.decode(response.body);
        final List<dynamic> branchList = responseBody['branches'];
        return branchList.map((json) => Branch.fromJson(json)).toList();

      } else {
        throw Exception('Failed to get Branch');
      }
    } catch (e) {
      debugPrint("error got like $e");
    }
    return branchList;
  }

  feachingTreatment() {}

  changingPaymentType(currentOption, value) {
    currentOption = value.toString();
  }
}
