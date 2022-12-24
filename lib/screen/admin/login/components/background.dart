import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/admin/login/components/frosted_glass_box.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key,required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[

        Center(child: Opacity(
            opacity: 0.15,
            child: SvgPicture.asset("assets/icons/MCB_Icon.svg",width: double.infinity,))),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_top.png',
            width: Get.width * 0.3,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_bottom.png',
            width: Get.width * 0.2,
          ),
        ),
        FrostedGlassBox(
          borderRadius: BorderRadius.circular(15),
          child:child ,
        ),
        //child
      ],
    );
  }
}
