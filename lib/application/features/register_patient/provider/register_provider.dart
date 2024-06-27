import 'dart:convert';
import 'dart:js_interop';
import 'package:amirtha_ayurveda/application/core/const_value.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_model.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  //

  TextEditingController nameController = TextEditingController();
  TextEditingController whatsNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController totleAmtController = TextEditingController();
  TextEditingController discountAmtController = TextEditingController();
  TextEditingController advanceAmtController = TextEditingController();
  TextEditingController balanceAmtController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> paymentOption = ["Cash", "Card", "UPI"];

  String currentOption;

  bool showTreatmentAdded = false;

  String currentBranch = '';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  int maleCount = 0;
  int femalecount = 0;

  RegisterProvider() : currentOption = "Cash";
  //

  dataPiker(context) async {
    final DateTime? dateTime = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        initialDate: DateTime.now());
    if (dateTime != null) {
      selectedDate = dateTime;
      notifyListeners();
    }
  }

  addingMaleCount() {
    maleCount++;
    notifyListeners();
  }

  minisingMaleCount() {
    if (maleCount > 0) {
      maleCount--;
      notifyListeners();
    }
  }

  addingFemaleCount() {
    femalecount++;
    notifyListeners();
  }

 pikingBranch(value){
   currentBranch = value;

   notifyListeners();
 }
  minasingFemaleCount() {
    if (femalecount > 0) {
      femalecount--;
      notifyListeners();
    }
  }

  timePiker(context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial);
    if (timeOfDay != null) {
      selectedTime = timeOfDay;
      notifyListeners();
    }
  }

  saveDate() async {
    const uri = "$baseUrl$endPointPateintListUpdate";
     Map<String, dynamic> body = {
  "name": nameController.text,
  "executive": nameController.text,
  "payment": currentOption,
  "phone": whatsNumberController.text,
  "address": addressController.text,
  "total_amount":   double.parse(totleAmtController.text),
  "discount_amount":double.parse(discountAmtController.text),
  "advance_amount": double.parse(advanceAmtController.text),
  "balance_amount": double.parse(balanceAmtController.text),
  "date_nd_time": "$selectedDate$selectedTime",
  "id": "",
  "male": maleCount.toString(),
  "female": femalecount.toString(),
  "branch":currentBranch ,
  "treatments": "Head Massage"
};
    try {
      final response = await http.post(Uri.parse(uri),
      body:body ,
          headers: {'Authorization': 'Bearer $currentUeserToken'});
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

  addingTretment(context) {
    showTreatmentAdded = true;
    notifyListeners();
    Navigator.of(context).pop();
  }

  deletingTretment(context) {
    showTreatmentAdded = false;
    notifyListeners();
  }

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

  changingPaymentType(value) {
    currentOption = value.toString();
    notifyListeners();
  }

  Future<List<Treatment>> fetchTreatments() async {
    const String url = '$baseUrl$endPointTreatment';
    try {
      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $currentUeserToken'});

      if (response.statusCode == 200) {
        List<Treatment> treatments = parseTreatments(response.body);
        return treatments;
      } else {
        throw Exception('Failed to load treatments');
      }
    } catch (e) {
      throw Exception('Failed to load treatments');
    }
  }

  List<Treatment> parseTreatments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Treatment>((json) => Treatment.fromJson(json)).toList();
  }
}
