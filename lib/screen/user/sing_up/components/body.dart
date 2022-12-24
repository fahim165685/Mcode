import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/sign_in/components/social_card.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';
import 'package:mcode/screen/user/sing_up/components/register_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
         right: -100,
            top: -100,
            child: Opacity(
              opacity: 0.15,
              child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0XFFA49FF9),
                Color(0XFFFFDCE0),
              ],
              )
          ),
        ),)),
        SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Register Account ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Complete yor details or connect with\nsocial media ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const RegisterFrom(),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: Get.width*0.1,),
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
                              text: " have a account",
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(()=> const SignInScreen(),duration: (const Duration(milliseconds: 500)));
                                  },
                                  child: const Text("Sing In",style: TextStyle(color: kPrimaryColor)),

                                ))
                          ]))
                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}
