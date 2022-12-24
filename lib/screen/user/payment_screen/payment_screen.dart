import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/constants.dart';

import '../payment_screen/components/body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CustomBorderIcon(
          color: kBGColor,
          press: (){
            Get.back();},
        ),
        title:const Text(
          "Payment",
          style: TextStyle(fontSize: 25, ),
        ) ,
      ),
      body: Body()
    );
  }
}