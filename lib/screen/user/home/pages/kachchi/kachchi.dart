import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class Kachchi extends StatelessWidget {
  const Kachchi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());

    return Obx(() => GridView.builder(
      itemCount: controller.kacchiList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
      try{
        return ProductCard(
          image: controller.kacchiList[index].image![0],
          productName: controller.kacchiList[index].name!,
          description:controller.kacchiList[index].description!,
          isFavorite:controller.kacchiList[index].isFavourite!,
          onFavorite: (){
            print(controller.kacchiList[index].isFavourite!);
            controller.burgerFavorite(isFavorites:controller.kacchiList[index].isFavourite = !controller.kacchiList[index].isFavourite!, productID:controller.kacchiList[index].id!,);
            if(controller.kacchiList[index].isFavourite! == true){
              controller.addToFavorite(
                context: context,
                productID: controller.kacchiList[index].id!,
                image: controller.kacchiList[index].image![0],
                price:double.parse(controller.kacchiList[index].price.toString()),
                name: controller.kacchiList[index].name!,
                description: controller.kacchiList[index].description,
              );
            }else{
              controller.deleteFavorite(productID:controller.kacchiList[index].id!,context: context );
            }
          },
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          productId:controller.kacchiList[index].id!,
          price: double.parse(controller.kacchiList[index].price!),
          onTap: () {
            Get.to(() => DetailsScreen(
              productDataList: controller.kacchiList[index],
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
