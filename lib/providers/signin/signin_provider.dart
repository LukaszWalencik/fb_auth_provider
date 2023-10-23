import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signin/signin_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  SignInState _state = SignInState.initial();

  SigninProvider({required this.authRepository});
  SignInState get state => _state;

  final AuthRepository authRepository;

  Future<void> signin({required String email, required String password}) async {
    _state = _state.copyWith(signInStatus: SignInStatus.submitting);
    notifyListeners();
    try {
      await authRepository.signin(email: email, password: password);
      _state = _state.copyWith(signInStatus: SignInStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(signInStatus: SignInStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }
}
