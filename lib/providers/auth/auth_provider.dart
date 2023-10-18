import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.unknow();

  AuthProvider({required this.authRepository});
  AuthState get state => _state;

  final AuthRepository authRepository;
}
