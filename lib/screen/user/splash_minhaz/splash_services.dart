import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mcode/screen/user/my_home_page/my_home_page.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';

class SplashServices {
  void isLogIn(BuildContext context) {

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(
        const Duration(seconds: 3),
            () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage())),
      );
    }else{
      Timer(
        const Duration(seconds: 3),
            () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInScreen())),
      );
    }
  }
}
