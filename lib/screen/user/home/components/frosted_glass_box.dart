import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  const FrostedGlassBox(
      {Key? key,
      required this.height,
      required this.width,
      this.color = Colors.white,
      required this.child,
      required this.borderRadius,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(color: Colors.white.withOpacity(0.13)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          color.withOpacity(0.15),
                          color.withOpacity(0.05),
                        ])),
              ),
              Center(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
