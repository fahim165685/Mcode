import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/otp/components/otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("OTP Verification ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "We send in your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    //timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "This code will expired on ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                        TweenAnimationBuilder(
                            tween: Tween(begin: 30.0,end: 0),
                            duration: const Duration(seconds: 30),
                            builder: (context, value, child) => Text(
                              "00:${value.toInt()}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15,color: kPrimaryColor),
                            ),
                          onEnd: (){},
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.width*0.2,
                    ),
                    const OtpForm(),
                        SizedBox(
                          height: Get.width*0.2,
                        ),
                    TextButton(onPressed: (){},
                        child: const Text("Resend OTP Code",style:TextStyle(decoration: TextDecoration.underline,color: Colors.grey),))
                  ]),
                ))));
  }
}




