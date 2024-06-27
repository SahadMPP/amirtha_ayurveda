import 'package:amirtha_ayurveda/data/datasource/register_remote_datasource.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';
import 'package:amirtha_ayurveda/domain/repositories/register_repository.dart';

class RegisterRepoImpli implements RegisterRepo{

   RegisterRemoteDataSource registerRemoteDataSource   = RegisterRemoteDataSourceImplie();

  @override
  Future<List<Branch>> feachingBranch() async{
     final branch = await registerRemoteDataSource.feachingBranch();
     return branch;
  }

  @override
  Future<List<Treatment>> feachingTretments() async{
    final treatment = await registerRemoteDataSource.fetchTreatments();
    return treatment;
  }
  
  @override
  Future<void> resteringDeatileToDatabase({body}) async{
   final register = await registerRemoteDataSource.saveDate(body);
   return register;
  }

  
}