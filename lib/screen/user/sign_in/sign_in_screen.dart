import 'package:flutter/material.dart';
import 'package:mcode/screen/user/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  //static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
