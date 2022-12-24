import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/sign_in/components/sign_form.dart';
import 'package:mcode/screen/user/sign_in/components/social_card.dart';
import 'package:mcode/screen/user/sing_up/sign_up_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const Text("Welcome Back ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SignForm(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: Get.width*0.3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/google-icon.svg",
                    ),
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/facebook-2.svg",
                    ),
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/twitter.svg",
                    ),
                  ],
                ),
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
                            onPressed: () async{
                              Get.to(()=>const SignUpScreen());
                            },
                            child: const Text("Sing Up",style: TextStyle(color: kPrimaryColor)),
                          ))
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//socialCard
