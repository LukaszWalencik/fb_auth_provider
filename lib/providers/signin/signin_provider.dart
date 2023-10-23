import 'package:fb_auth_provider/providers/signin/signin_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  SignInState _state = SignInState.initial();

  SigninProvider({required this.authRepository});
  SignInState get state => _state;

  final AuthRepository authRepository;
}
