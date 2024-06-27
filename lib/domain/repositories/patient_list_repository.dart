import 'package:amirtha_ayurveda/domain/entities/patient_entitie.dart';

abstract class PatientListRepo {
  Future<List<Patient>> feachingPatientInDataBase();
}