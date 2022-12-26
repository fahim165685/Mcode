import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/cart/components/my_cart_product.dart';
import 'package:mcode/screen/user/cart/controller/card_controller.dart';
import 'package:mcode/screen/user/payment_screen/payment_screen.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CardController controller =Get.put(CardController());
    return Obx(() =>  (controller.cardList.isEmpty)? emptyItem(): Column(
      children: [
        Expanded(
            flex: 9,
            child:  ListView.builder(
              itemCount: controller.cardList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => MyCartProduct(
                controller: controller,
                onRemove: () {
                  controller.deleteCard(
                    context: context,
                    productID: controller.cardList[index].id!
                  );
                },
                image:  controller.cardList[index].image! ,
                price: controller.cardList[index].price!,
                name:  controller.cardList[index].name!,
              ),
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
    ));
  }

  Column emptyItem() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(child: Icon(Icons.remove_shopping_cart,size: 200,)),
              SizedBox(height: 20,),
              Center(child: Text("Your card is empty",style: TextStyle(fontSize: 30))),
            ],
          );
  }


}
