import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<void> login({required String username, required String password,required BuildContext context});
}
