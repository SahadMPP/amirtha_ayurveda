import 'package:amirtha_ayurveda/data/repositories/patient_list_repo_impli.dart';
import 'package:amirtha_ayurveda/domain/entities/patient_entitie.dart';
import 'package:amirtha_ayurveda/domain/repositories/patient_list_repository.dart';

class PatientListUseCase {
  PatientListRepo patientListRepo = PatientListRepoImpli();

  Future<List<Patient>> feachingPatientIndataBase() async {
    final patient = await patientListRepo.feachingPatientInDataBase();
    return patient;
  }
}
