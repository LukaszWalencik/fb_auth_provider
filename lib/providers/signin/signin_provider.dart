import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signin/signin_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class SigninProvider extends StateNotifier<SignInState> with LocatorMixin {
  SigninProvider() : super(SignInState.initial());

  Future<void> signin({required String email, required String password}) async {
    state = state.copyWith(signInStatus: SignInStatus.submitting);
    try {
      final authRepository = read<AuthRepository>();
      await authRepository.signin(email: email, password: password);
      state = state.copyWith(signInStatus: SignInStatus.success);
    } on CustomError catch (e) {
      state = state.copyWith(signInStatus: SignInStatus.error, error: e);
      rethrow;
    }
  }
}
