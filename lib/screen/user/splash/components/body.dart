import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/login/admil_login.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';
import 'package:mcode/screen/user/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "First Delivery service",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Prepared by expert",
      "image": "assets/images/splash_2.jpg"
    },
    {
      "text": "Cash on delivery service",
      "image": "assets/images/splash_3.jpg"
    },
    {
      "text": "Enjoy with everyone",
      "image": "assets/images/splash_4.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal:20
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      text: splashData[index]["text"]!,
                      image: splashData[index]["image"]!,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Column(

                  children: <Widget>[
                    const Spacer(flex:2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                   const Spacer(flex: 2),
                    DefaultButton(
                      text: "Continue",
                      press: (){
                        Get.to(()=> const SignInScreen(),duration: const Duration(milliseconds:500),transition:Transition.fade);
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(()=>const AdminLogin());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(text: const TextSpan(
                          children: [
                           TextSpan(text: "Admin ",style: TextStyle(color: Colors.black)),
                           TextSpan(text: "Login",style: TextStyle(color: kPrimaryColor)),
                          ]
                        )),
                      ),
                    ),
                    
                  const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin:const EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 25 : 10,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
