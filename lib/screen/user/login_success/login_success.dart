import 'package:flutter/material.dart';
import 'package:mcode/screen/user/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
