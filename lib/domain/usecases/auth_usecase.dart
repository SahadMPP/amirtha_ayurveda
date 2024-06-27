import 'package:amirtha_ayurveda/data/repositories/auth_repo_impli.dart';
import 'package:amirtha_ayurveda/domain/repositories/auth_repository.dart';

class AuthUseCase {


    AuthRepo authRepo = AuthRepoImpli();

  Future<void> login({required  username,required password,required context})async{
    final login = await authRepo.login(username: username, password: password, context: context);
    return login;
  }
}