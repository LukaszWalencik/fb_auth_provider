import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:state_notifier/state_notifier.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.unknow());

  @override
  void update(Locator watch) {
    final user = watch<fbAuth.User?>();
    if (user != null) {
      state = state.copyWith(authStatus: AuthStatus.authenticated, user: user);
    }
    if (user == null) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
    }
    print('AuthStatus: ${state.authStatus}');

    super.update(watch);
  }

  void signout() async {
    await read<AuthRepository>().signout();
  }
}
