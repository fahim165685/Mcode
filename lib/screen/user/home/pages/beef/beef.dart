import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class Beef extends StatelessWidget {
  const Beef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());
    return Obx(() =>   GridView.builder(
      itemCount: controller.beefList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
     // ProductDataList productDataList= controller.beefList[index];

      try{
        return ProductCard(
          image: controller.beefList[index].image![0],
          productName: controller.beefList[index].name!,
          description:controller.beefList[index].description!,
          isFavorite:controller.beefList[index].isFavourite!,
          onFavorite: (){
            print(controller.beefList[index].isFavourite!);
            controller.burgerFavorite(isFavorites:controller.beefList[index].isFavourite = !controller.beefList[index].isFavourite!, productID:controller.beefList[index].id!,);

            if(controller.beefList[index].isFavourite! == true){
              controller.addToFavorite(
                context: context,
                productID: controller.beefList[index].id!,
                image: controller.beefList[index].image![0],
                price:double.parse(controller.beefList[index].price.toString()),
                name: controller.beefList[index].name!,
                description: controller.beefList[index].description,
              );
            }else{
              controller.deleteFavorite(productID:controller.beefList[index].id!,context: context );
            }
          },
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          productId:controller.beefList[index].id!,
          price: double.parse(controller.beefList[index].price!,),
          onTap: () {
            Get.to(() =>  DetailsScreen(
              productDataList: controller.beefList[index],
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
