import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
    this.size=18,

  }) : super(key: key);
  final String svgIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: SvgPicture.asset(svgIcon, height: size),
    );
  }
}
