import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),

        // Image.asset("assets/images/Logo.png",
        //   width: getProportionateScreenWidth(50),
        //   height: getProportionateScreenHeight(50),
        // ),

         Text(
          text,
          style: const TextStyle(
              fontSize: 30,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing\ndummy",
          textAlign: TextAlign.center,
        ),

        Spacer(flex: 2),
        Image.asset(
          image,
         // height: Get.width*0.3,
          width: Get.width*0.8
        ),
      ],
    );
  }
}