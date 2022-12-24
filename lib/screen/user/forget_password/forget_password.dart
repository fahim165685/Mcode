import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_border_icon.dart';

import '../forget_password/components/body.dart';

class Controller extends GetxController {
  var obscureText = true.obs;
  var checkbox = true.obs;
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
