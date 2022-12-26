import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/animated_button.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/forget_emile_page/forgot_password_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../login_success/login_success.dart';

class GController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool checkbox = true.obs;
}

class SignForm extends StatefulWidget {
   const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  TextEditingController emileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  GController controller = Get.put(GController());
  //Firebase.....
  FirebaseAuth auth = FirebaseAuth.instance;
  void LogIn(){
    auth.signInWithEmailAndPassword(
      email: emileController.text.toString(),
      password: passwordController.text.toString(),
    ).then((value){
      customSnackBar(context: context, contentType: ContentType.success, title: "Successful", massage: "Your Account LogIn Successful");
      Get.to(()=>const LoginSuccessScreen());
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      customSnackBar(context: context, contentType: ContentType.failure, title: "Warning", massage: "Information not valid");
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emileController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            //Emile
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
                labelText: "Email"),
            //Password
            Obx(()=> CustomTextFormField(
              controller: passwordController,
              obscureText: controller.obscureText.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return kPassNullError;
                } else if (value.length < 6) {
                  return kShortPassError;
                } else if (value.length > 15) {
                  return 'Should Not Be More Than 15 Characters';
                }
                return null;
              },
              labelText: "Password",
              suffixIcon: IconButton(
                color: Colors.grey,
                onPressed: () {
                  controller.obscureText.value= !controller.obscureText.value;
                },
                icon: (controller.obscureText.value == false)
                    ? const Icon(Icons.visibility_outlined, size: 29)
                    : const Icon(Icons.visibility_off_outlined, size: 29),
              ),
            )),
            Row(
              children: [
                Obx(() => Checkbox(
                  focusColor: kPrimaryColor,
                  activeColor: kPrimaryColor,
                  value: controller.checkbox.isTrue,
                  onChanged: (value) {
                    controller.checkbox.value = !controller.checkbox.value;
                  },
                ),),
                const Text("Remember me"),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordScreen(),duration: const Duration(seconds: 1));
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey),
                    ))
              ],
            ),
            AnimationButton(
              text: "Continue",
              onTap: () {
                final isValidFrom = formKey.currentState!.validate();
                if (isValidFrom) {
                  LogIn();
                }
              },
            ),
          ],
        ));
  }
}
