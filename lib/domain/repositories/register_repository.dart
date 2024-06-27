import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';

abstract class RegisterRepo{

  Future<List<Branch>> feachingBranch();

  Future<List<Treatment>> feachingTretments();

  Future<void> resteringDeatileToDatabase({dynamic body});
}