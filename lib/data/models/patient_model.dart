import 'package:amirtha_ayurveda/domain/entities/patient_entitie.dart';

class PatientModel extends Patient {

  // ignore: use_super_parameters
  PatientModel({
    required name,
    required id,
    required treatmentName,
    required branchName,
    required dateTime,
  }):super(id: id,branchName: branchName,dateTime: dateTime,name: name,treatmentName: treatmentName);

   factory PatientModel.fromJson(Map<String, dynamic> json) {
  return PatientModel(
    name: json['name'] ?? "Unknown name",
    id: json['id'] ?? 0,
    treatmentName: json['patientdetails_set'] != null && json['patientdetails_set'].isNotEmpty
        ? json['patientdetails_set'][0]['treatment_name'] ?? 'Unknown Treatment'
        : 'Unknown Treatment', 
    branchName: json['branch'] != null ? json['branch']['name'] ?? 'Unknown Branch' : 'Unknown Branch', 
    dateTime: json['date_nd_time'] != null ? DateTime.parse(json['date_nd_time']) : DateTime.now(), 
  );
}

  
}