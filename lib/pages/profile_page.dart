import 'package:fb_auth_provider/providers/profile/profile_provider.dart';
import 'package:fb_auth_provider/providers/profile/profile_state.dart';
import 'package:fb_auth_provider/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
