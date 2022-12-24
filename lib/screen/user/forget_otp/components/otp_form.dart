import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
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

  void nextField({String? value, FocusNode? focusNode}){
    if (value?.length ==1){
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(

        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 60,
                    child:TextFormField(
                      autofocus: true,
                      style: const TextStyle(fontSize: 30),
                      obscureText: obscureText,
                      textAlign: TextAlign.center,
                      decoration:otpInputBorder,
                      onChanged: (value) {
                        nextField(value: value,focusNode: pin2FocusNode);
                      },
                    )
                ),

                SizedBox(width: 60,
                    child:TextFormField(
                      focusNode: pin2FocusNode,
                      style: const TextStyle(fontSize: 30),
                      obscureText: obscureText,
                      textAlign: TextAlign.center,
                      decoration:otpInputBorder,
                      onChanged: (value) {
                        nextField(value: value,focusNode: pin3FocusNode);
                      },
                    )
                ),

                SizedBox(width: 60,
                    child:TextFormField(
                      focusNode: pin3FocusNode,
                      style: const TextStyle(fontSize: 30),
                      obscureText: obscureText,
                      textAlign: TextAlign.center,
                      decoration:otpInputBorder,
                      onChanged: (value) {
                        nextField(value: value,focusNode: pin4FocusNode);
                      },
                    )
                ),

                SizedBox(width: 60,
                    child:TextFormField(
                      focusNode: pin4FocusNode,
                      style: const TextStyle(fontSize: 30),
                      obscureText: obscureText,
                      textAlign: TextAlign.center,
                      decoration:otpInputBorder,
                      onChanged: (value) {
                        pin4FocusNode.unfocus();
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: Get.width*0.4,),
            DefaultButton(
                text: "Continue",
                press: (){
                  Get.to(()=>const SignInScreen());
                }
            ),

          ],
        )
    );
  }
}