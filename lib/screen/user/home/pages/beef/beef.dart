import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/get_product_controller.dart';

class Beef extends StatelessWidget {
  const Beef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetProductController controller =Get.put(GetProductController());
    return Obx(() =>   GridView.builder(
      itemCount: controller.beefList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
      ProductDataList productDataList= controller.beefList[index];

      try{
        return ProductCard(
          image: productDataList.image![0],
          productName: productDataList.name!,
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          price: double.parse(productDataList.price!),
          onTap: () {
            Get.to(() =>  DetailsScreen(
              productDataList: productDataList,
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
