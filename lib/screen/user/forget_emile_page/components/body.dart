import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/forget_emile_page/components/forgot_pass_form.dart';
import 'package:mcode/screen/user/sing_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:  [
                 const Spacer(flex: 1),
                  const Text("Forgot Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Sign in your email and we will send you a link to return to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(flex: 2),
                  const ForgotPassForm(),
                  const Spacer(flex: 1),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            const TextSpan(
                              text: "Don't have a account",
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(()=> const SignUpScreen());
                                  },
                                  child: const Text("Sing Up",style: TextStyle(color: kPrimaryColor)),
                                ))
                          ])),
                  const Spacer(flex: 4),
                ],
              ),
            )
        )
    );
  }
}
