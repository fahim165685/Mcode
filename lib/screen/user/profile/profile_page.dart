import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/screen/user/profile/components/body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Body(),
    );
  }
}
