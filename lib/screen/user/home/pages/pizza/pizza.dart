import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class Pizza extends StatelessWidget {
  const Pizza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());
    return Obx(() =>   GridView.builder(
      itemCount: controller.pizzaList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
      try{
        return ProductCard(
          image: controller.pizzaList[index].image![0],
          productName: controller.pizzaList[index].name!,
          description:controller.pizzaList[index].description!,
          isFavorite:controller.pizzaList[index].isFavourite!,
          onFavorite: (){
            print(controller.pizzaList[index].isFavourite!);
            controller.burgerFavorite(isFavorites:controller.pizzaList[index].isFavourite = !controller.pizzaList[index].isFavourite!, productID:controller.pizzaList[index].id!,);
            if(controller.pizzaList[index].isFavourite! == true){
              controller.addToFavorite(
                context: context,
                productID: controller.pizzaList[index].id!,
                image: controller.pizzaList[index].image![0],
                price:double.parse(controller.pizzaList[index].price.toString()),
                name: controller.pizzaList[index].name!,
                description: controller.pizzaList[index].description,
              );
            }else{
              controller.deleteFavorite(productID:controller.pizzaList[index].id!,context: context );
            }
          },
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          productId:controller.pizzaList[index].id!,
          price:double.parse(controller.pizzaList[index].price!.toString()) ,
          onTap: () {
            Get.to(() => DetailsScreen(
              productDataList: controller.pizzaList[index],
            ),transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 700));
          },
        );
      }
      catch(error){
        return   Text(error.toString()); //Image.asset("assets/images/No_image_found.png");
      }
    },));
  }
}
