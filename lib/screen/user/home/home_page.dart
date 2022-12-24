import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/screen/user/home/components/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: CustomBorderIcon(
          press: () {},
          icon: Icons.dehaze_outlined,

        ),
        actions: [
          CustomBorderIcon(
            press: () {},
            icon: Icons.person,
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
