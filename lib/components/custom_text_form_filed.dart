import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';

class CustomTextFormField extends StatelessWidget {

  const CustomTextFormField({Key? key,
    this.controller,
    required this.labelText,
    this.obscureText=false,
    this.padding=12,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController? controller;
  final  String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon,prefixIcon;
  final TextInputType? keyboardType;
  final double padding;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: padding),
      child: TextFormField(
        maxLines:maxLines,
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
            border: outlineInputBorder(),
            labelText: labelText,
            hintText: "Enter Your $labelText",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
