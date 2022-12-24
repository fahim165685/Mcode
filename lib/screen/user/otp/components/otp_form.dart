import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/forget_password/forget_password.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool obscureText = false;

  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value?.length == 1) {
      focusNode?.requestFocus();
    }
  }
  TextEditingController con1=TextEditingController();
  TextEditingController con2=TextEditingController();
  TextEditingController con3=TextEditingController();
  TextEditingController con4=TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                buildTextField(controller: con1,focusNode:(value) {nextField(value: value, focusNode: pin2FocusNode);}),
                buildTextField(controller: con2,focus: pin2FocusNode,focusNode:(value) {nextField(value: value, focusNode: pin3FocusNode);}),
                buildTextField(controller: con3,focus: pin3FocusNode,focusNode:(value) {nextField(value: value, focusNode: pin4FocusNode);}),
                buildTextField(controller: con4,focus: pin4FocusNode,focusNode:(value) {pin4FocusNode.unfocus();},),

              ],
            ),
            SizedBox(
              height: Get.width * 0.4,
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  final isValidFrom = formKey.currentState!.validate();
                  if (isValidFrom) {
                    Get.to(() => const SignInScreen());
                  }
                }),
          ],
        ));
  }

  SizedBox buildTextField({required TextEditingController controller,void Function(String)?  focusNode,FocusNode? focus}) {
    return SizedBox(
        width: 60,
        child: TextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return "*";
            }
            return null;
          },
          autofocus: true,
          focusNode:focus ,
          style: const TextStyle(fontSize: 30),
          obscureText: obscureText,
          textAlign: TextAlign.center,
          decoration: otpInputBorder,
          onChanged: focusNode,
        ));
  }
}
