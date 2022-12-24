import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/screen/user/cart/components/body.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),),
      body: const Body(),
    );
  }
}
