import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/screen/user/forget_emile_page/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: CustomBorderIcon(
          press: ()=>Navigator.pop(context),
        ),
      ),
      body: const Body(),
    );
  }
}
