import 'package:amirtha_ayurveda/data/repositories/register_repo_impli.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';
import 'package:amirtha_ayurveda/domain/repositories/register_repository.dart';

class RegisterUseCase {
  RegisterRepo registerRepo = RegisterRepoImpli();

  Future<List<Branch>> feachingBranch() async {
    final branch = await registerRepo.feachingBranch();
    return branch;
  }

  Future<List<Treatment>> feachingTretments() async {
    final treatment = await registerRepo.feachingTretments();
    return treatment;
  }

  Future<void> resteringDeatileToDatabase() async {
    final regited = await registerRepo.resteringDeatileToDatabase();
    return regited;
  }
}
