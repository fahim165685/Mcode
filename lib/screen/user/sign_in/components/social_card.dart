import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mcode/constants.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final VoidCallback press;

  const SocialCard({super.key, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      focusColor: kPrimaryColor,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColor.withOpacity(0.2)
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}