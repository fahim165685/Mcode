import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';

ThemeData theme(){
  return ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
      primary:kPrimaryColor,
    ),
    primaryColor: kPrimaryColor,
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor:kBGColor,
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: kTextColor),
      gapPadding: 10,
  );
  OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: kPrimaryColor,width: 2,),
    gapPadding: 10,
  );

  OutlineInputBorder enabledBorder = OutlineInputBorder(

    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: kTextColor,),
    gapPadding: 10,
  );

   return InputDecorationTheme(
 //floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42,vertical: 20),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
     border: outlineInputBorder,
  );
}


TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor,),
    bodyText2: TextStyle(color: kTextColor,),
  );
}
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kBGColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: (TextStyle(color: Color(0XFF8B8B8B), fontSize: 22)),
    iconTheme: IconThemeData(color: Colors.black),
  );
}