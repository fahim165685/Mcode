import 'package:flutter/material.dart';
import 'package:mcode/screen/user/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName ="/splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
