import 'package:fb_auth_provider/providers/auth/auth_provider.dart';
import 'package:fb_auth_provider/providers/profile/profile_provider.dart';
import 'package:fb_auth_provider/providers/profile/profile_state.dart';
import 'package:fb_auth_provider/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileProvider profilProvider;

  @override
  void initState() {
    profilProvider = context.read<ProfileProvider>();
    profilProvider.addListener(errorDialogListener);
    getProfile();
    super.initState();
  }

  void getProfile() {
    final String uid = context.read<fbAuth.User?>()!.uid;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile(uid: uid);
    });
  }

  void errorDialogListener() {
    if (profilProvider.state.profileStatus == ProfileStatus.error) {
      errorDialog(context, profilProvider.state.customError);
    }
  }

  @override
  void dispose() {
    profilProvider.removeListener(errorDialogListener);
    super.dispose();
  }

  Widget _buildProfile() {
    final profileState = context.watch<ProfileProvider>().state;
    if (profileState.profileStatus == ProfileStatus.initial) {
      return Container();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildProfile());
  }
}
