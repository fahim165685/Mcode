import 'package:flutter/material.dart';
import 'package:mcode/screen/admin/login/components/body.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:  () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body:Body(),
      ),
    );
  }
}
