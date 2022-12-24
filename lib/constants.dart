import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFFff5230);
const kBGColor =  Color(0XFFedeff4);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kTextLiteColor = Color(0xFF000000);
const kAnimationDuration = Duration(milliseconds: 400);

final kFormKey= GlobalKey<FormState>();

final kEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String kEmailNullError = "Please Enter your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your Password";
const String kShortPassError = "password is too short";
const String kMatchPassError = "Password don't match";

final otpInputBorder = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 15,
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: kPrimaryColor)),
  focusedBorder: outlineInputBorder(),
);
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: kTextColor));
}

customSnackBar({required BuildContext context,
  required ContentType
  contentType,required
  String title,required
  String massage,}){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.none,
      content: AwesomeSnackbarContent(
        title: title,
        message: massage,
        contentType: contentType,
        inMaterialBanner: false,
      )));

}