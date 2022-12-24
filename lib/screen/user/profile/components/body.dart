import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/profile/components/profile_image.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Profile icon
        const ProfileImage(),
        buildListTitle(
          press: (){},
          icon: "assets/icons/User Icon.svg",
          titleName: "My Profile"
        ),
        buildListTitle(
            press: (){},
            icon: "assets/icons/Bell.svg",
            titleName: "Notification"
        ),
        buildListTitle(
            press: (){},
            icon: "assets/icons/Cash.svg",height: 25,
            titleName: "Payment"
        ),
        buildListTitle(
            press: (){},
            icon: "assets/icons/Settings.svg",
            titleName: "Settings"
        ),
        buildListTitle(
            press: (){},
            icon: "assets/icons/Question mark.svg",
            titleName: "Help Center"
        ),buildListTitle(
            press: (){
              showDialog<void>(
                context: context,
                barrierDismissible: true,
                // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure to log out?'),
                    actions: <Widget>[
                      TextButton(
                        style:const ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(kPrimaryColor)
                        ),
                        child: const Text('No'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      TextButton(
                        style:const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(kPrimaryColor)
                        ),
                        child: const Text('Yes'),
                        onPressed: ()async {
                          await FirebaseAuth.instance.signOut();

                          Get.offAll(()=>const SignInScreen(),duration: const Duration(seconds: 1),transition: Transition.cupertinoDialog);
                       },
                      ),

                    ],
                  );
                },
              );
            },
            icon: "assets/icons/Log out.svg",
            titleName: "Log Out"
        ),


      ],
    );
  }

  Padding buildListTitle({
    required String icon,required String titleName,required VoidCallback press,double height = 30.00,double width =30.00}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child: ListTile(
          title: Text(titleName),
          onTap: press,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: SvgPicture.asset(icon,color: kPrimaryColor,width:width,height: height,),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),

        ),
      );
  }
}


