import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/otp/otp_screen.dart';


class ForgotPassForm extends StatelessWidget {
  const ForgotPassForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emileController=TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: emileController,
                validator: (emile) {
                  bool isValid = kEmailValid.hasMatch(emile.toString());
                  if (emile!.isEmpty) {
                    return kEmailNullError;
                  } else if (isValid == false) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
                suffixIcon: const Icon(Icons.email_outlined),
                labelText: "Emile"),
            const SizedBox(
              height: 100,
            ),
            DefaultButton(
              text: "Send",
              press: () {
                final isValidFrom = formKey.currentState!.validate();
                if (isValidFrom) {
                  Get.to(()=>const OtpScreen(),duration: const Duration(milliseconds: 500),transition: Transition.leftToRight);
                }
              },
            ),
          ],
        ));
  }
}
