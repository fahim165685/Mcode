import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/screen/user/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification",),
        leading: CustomBorderIcon(
          press: ()=>Navigator.pop(context),
        ),
      ),
      body: const Body(),
    );
  }
}
