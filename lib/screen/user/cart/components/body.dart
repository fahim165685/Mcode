import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/cart/components/my_cart_product.dart';
import 'package:mcode/screen/user/payment_screen/payment_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 9,
            child: ListView(
              children: [
                MyCartProduct(
                  onRemove: () {},
                  image: "assets/images/bergar.png",
                  price: 320,
                  name: "Margherita burger",
                ),
                MyCartProduct(
                  onRemove: () {},
                  image: "assets/images/chicken.png",
                  price: 399,
                  name:"Chicken Item",
                ),
                MyCartProduct(
                  onRemove: () {},
                  image: "assets/images/sea_fish.png",
                  price: 530,
                  name: "Sea Fish",
                ),
                MyCartProduct(
                  onRemove: () {},
                  image: "assets/images/drikns.png",
                  price: 160,
                  name: "Drinks",
                ),
              ],
            )),
        Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    RichText(text: TextSpan(
                        text: "Total:\n",style: TextStyle(fontSize: 16,color: Colors.grey.withOpacity(0.8)),
                        children: const [
                          TextSpan(
                            text: "৳ 1025",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: kTextColor),
                          ),
                        ]
                    )),

                    ElevatedButton(
                        onPressed: () {
                          Get.to(()=> PaymentScreen());
                        },
                        style: ButtonStyle(
                            fixedSize: const MaterialStatePropertyAll(
                                Size(200, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(50))),
                            backgroundColor:
                            const MaterialStatePropertyAll(
                                kPrimaryColor)),
                        child: const Text("Next"))
                  ]),
            )),
      ],
    );
  }


}
