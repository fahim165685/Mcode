import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.press})
      : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20, horizontal: 40),),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor)
          ),
          onPressed: press,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
