import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
   final BorderRadiusGeometry borderRadius;
  final Widget child;

  const FrostedGlassBox(
      {Key? key,
      required this.child,
      required this.borderRadius,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(color: Colors.white),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
