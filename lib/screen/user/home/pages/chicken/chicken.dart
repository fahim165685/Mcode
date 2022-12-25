import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/get_product_controller.dart';

class Chicken extends StatelessWidget {
  const Chicken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetProductController controller =Get.put(GetProductController());

    return Obx(() =>   GridView.builder(
      itemCount: controller.chickenList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
      try{
        return ProductCard(
          image: controller.chickenList[index].image![0],
          productName: controller.chickenList[index].name!,
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          price: double.parse(controller.chickenList[index].price!),
          onTap: () {
            Get.to(() => DetailsScreen(
              productDataList: controller.chickenList[index],
            ),transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 700));
          },
        );
      }
      catch(error){
        return Image.asset("assets/images/No_image_found.png");
      }
    },));
  }
}
