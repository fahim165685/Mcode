import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class Drinks extends StatelessWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());

    return Obx(() => GridView.builder(
      itemCount: controller.drinksList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ),
      itemBuilder: (context, index) {
       try{
        return ProductCard(
          image: controller.drinksList[index].image![1],
          productName: controller.drinksList[index].name!,
          description:controller.drinksList[index].description!,
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          isFavorite:controller.drinksList[index].isFavourite!,
          onFavorite: (){
            print(controller.drinksList[index].isFavourite!);
            controller.burgerFavorite(isFavorites:controller.drinksList[index].isFavourite = !controller.drinksList[index].isFavourite!, productID:controller.drinksList[index].id!,);
            if(controller.drinksList[index].isFavourite! == true){
              controller.addToFavorite(
                context: context,
                productID: controller.drinksList[index].id!,
                image: controller.drinksList[index].image![0],
                price:double.parse(controller.drinksList[index].price.toString()),
                name: controller.drinksList[index].name!,
                description: controller.drinksList[index].description,
              );
            }else{
              controller.deleteFavorite(productID:controller.drinksList[index].id!,context: context );
            }
          },
          productId:controller.drinksList[index].id!,
          price: double.parse(controller.drinksList[index].price!) ,
          onTap: () {
            Get.to(() => DetailsScreen(
              productDataList: controller.drinksList[index],
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
