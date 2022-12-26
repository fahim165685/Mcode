import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/user/splash/splash_screen.dart';



class SplashController extends GetxController {
  RxBool animate= false.obs;
  @override
  void onInit() {
    startAnimation();
    super.onInit();
  }

  //animate
  Future startAnimation()async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
   Get.offAll(()=>const SplashScreen(),duration: const Duration(milliseconds: 500),transition: Transition.fade);
  }

}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  @override
  Widget build(BuildContext context) {


   SplashController controller=Get.put(SplashController());
    return Scaffold(

      body:SizedBox(
        child: Stack(
          children: [
            AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                top: controller.animate.value ? 0: -30,
                left:controller.animate.value ? 0: -50,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf4b8f5),
                        Color(0xFFf76b1c),
                      ]
                    ),
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent
                  ),
                ),
            ),

            AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                right: controller.animate.value ? -100:100,
                bottom:  controller.animate.value ? -150:-50,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf9e2ae),
                        Color(0xFFa6d676),
                      ]
                    ),
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent
                  ),
                ),
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
             Positioned(
                top:0,
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                    width: Get.width*0.5,
                    child: Image.asset("assets/images/MCB_Logo_ Main.png",)),
              ),

          ],
        ),
      ),
    );
  }
}