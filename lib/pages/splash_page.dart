import 'package:fb_auth_provider/pages/my_home_page.dart';
import 'package:fb_auth_provider/pages/signin_page.dart';
import 'package:fb_auth_provider/pages/signup_page.dart';
import 'package:fb_auth_provider/providers/auth/auth_provider.dart';
import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthProvider>().state;
    if (authState == AuthStatus.unauthenticated) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage()));
      });
    } else if (authState == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
