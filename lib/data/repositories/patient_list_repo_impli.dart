import 'package:amirtha_ayurveda/data/datasource/patient_list_remote_datasource.dart';
import 'package:amirtha_ayurveda/domain/entities/patient_entitie.dart';
import 'package:amirtha_ayurveda/domain/repositories/patient_list_repository.dart';

class PatientListRepoImpli implements PatientListRepo {
  PatientListRemoteDatesource patientListRemotedata =
      PatientListRemoteDatesourceImpli();

  @override
  Future<List<Patient>> feachingPatientInDataBase() async {
    final patient = await patientListRemotedata.fetchPatient();
    return patient;
  }
}
