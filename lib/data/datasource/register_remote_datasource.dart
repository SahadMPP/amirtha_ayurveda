import 'dart:convert';

import 'package:amirtha_ayurveda/application/core/const/const_value.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/data/models/branch_model.dart';
import 'package:amirtha_ayurveda/data/models/tretment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<List<BranchModel>> feachingBranch();

  Future<List<TreatmentModel>> fetchTreatments();

  Future<void> saveDate(dynamic body);
}

class RegisterRemoteDataSourceImplie extends RegisterRemoteDataSource {
  @override
  Future<List<BranchModel>> feachingBranch() async {
    List<BranchModel> branchList = [];

    const String url = '$baseUrl$endPointBranchList';
    try {
      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $currentUeserToken'});

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final List<dynamic> branchList = responseBody['branches'];
        return branchList.map((json) => BranchModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get Branch');
      }
    } catch (e) {
      debugPrint("error got like $e");
    }
    return branchList;
  }

  @override
  Future<List<TreatmentModel>> fetchTreatments() async {
    const String url = '$baseUrl$endPointTreatment';
    try {
      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $currentUeserToken'});

      if (response.statusCode == 200) {
        List<TreatmentModel> treatments =
            RegisterProvider.parseTreatments(response.body);
        return treatments;
      } else {
        throw Exception('Failed to load treatments');
      }
    } catch (e) {
      throw Exception('Failed to load treatments');
    }
  }

  @override
  Future<void> saveDate(dynamic body) async {
    const uri = "$baseUrl$endPointPateintListUpdate";

    try {
      final response = await http.post(Uri.parse(uri),
          body: body, headers: {'Authorization': 'Bearer $currentUeserToken'});
      if (response.statusCode == 200) {
        debugPrint('Data added successfully');
      } else {
        throw Exception(
            "sava to data failed got statusCode = ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("printing error $e");
    }
  }
}
