import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signup/signup_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class SignUpProvider extends StateNotifier<SignUpState> with LocatorMixin {
  SignUpProvider() : super(SignUpState.initial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(signUpStatus: SignUpStatus.submitting);
    try {
      final authRepository = read<AuthRepository>();
      await authRepository.signup(
        name: name,
        email: email,
        password: password,
      );
      state = state.copyWith(signUpStatus: SignUpStatus.success);
    } on CustomError catch (e) {
      state = state.copyWith(signUpStatus: SignUpStatus.error, error: e);
      rethrow;
    }
  }
}
