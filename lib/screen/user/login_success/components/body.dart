import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/my_home_page/my_home_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.width*0.1,),
        Image.asset("assets/images/success.png"),
        SizedBox(height: Get.width*0.1,),
        const Text("Login Success",style: TextStyle(color: kSecondaryColor,fontSize: 35),),
        SizedBox(height: Get.width*0.1,),
        SizedBox(
          width: Get.width*0.9,
          child: DefaultButton(
            text: "Go to Home",
            press: (){
              Get.offAll(()=>const MyHomePage(),duration: const Duration(seconds: 1),transition:Transition.leftToRight );
            },
          ),
        )
      ]
    );
  }
}
