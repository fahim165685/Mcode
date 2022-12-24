import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';

class CustomBorderIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color color;
  final double padding;
  final VoidCallback press;

  const CustomBorderIcon({
    super.key,
    required this.press,
    this.icon = Icons.arrow_back_ios,
    this.iconColor = kTextLiteColor,
    this.color=Colors.white,
    this.padding = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8
      ),
      child: Material(
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Colors.transparent,
        child: Ink(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: InkWell(
            onTap: press,
            borderRadius: BorderRadius.circular(10),
            child:  Icon(
                icon,
                color: kTextLiteColor,
                size: 25,
              ),
            ),
          ),
      ),
    );
  }
}
