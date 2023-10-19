import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.unknow();

  AuthProvider({required this.authRepository});
  AuthState get state => _state;

  final AuthRepository authRepository;

  void update(fbAuth.User? user) {
    if (user != null) {
      _state =
          _state.copyWith(authStatus: AuthStatus.authenticated, user: user);
    }
    if (user == null) {
      _state = _state.copyWith(authStatus: AuthStatus.unauthenticated);
    }
    print('AuthStatus: ${_state.authStatus}');
    notifyListeners();
  }

  void signout() async {
    await authRepository.signout();
  }
}
