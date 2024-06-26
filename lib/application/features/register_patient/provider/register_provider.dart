import 'dart:convert';
import 'package:amirtha_ayurveda/data/models/tretment_model.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';
import 'package:amirtha_ayurveda/domain/usecases/register_usecase.dart';
import 'package:flutter/material.dart';

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

  pikingBranch(value) {
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

 
  Future<void> saveDate() {
    return RegisterUseCase().resteringDeatileToDatabase();
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
    return RegisterUseCase().feachingBranch();
  }

  changingPaymentType(value) {
    currentOption = value.toString();
    notifyListeners();
  }

  Future<List<Treatment>> fetchTreatments() async {
    return RegisterUseCase().feachingTretments();
  }

  static List<TreatmentModel> parseTreatments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<TreatmentModel>((json) => TreatmentModel.fromJson(json))
        .toList();
  }
}
