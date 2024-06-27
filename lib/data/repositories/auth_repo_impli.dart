import 'package:amirtha_ayurveda/data/datasource/auth_remote_datasource.dart';
import 'package:amirtha_ayurveda/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepoImpli implements AuthRepo {
  AuthRemoteDataSource authRemoteDatasource = AuthRemoteDataSourceImpliments();

  @override
  Future<void> login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    final login = await authRemoteDatasource.goTologin(
        username: username, password: password, context: context);
        return login;
  }
}
