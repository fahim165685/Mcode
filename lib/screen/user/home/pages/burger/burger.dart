import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class Burger extends StatelessWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());

    return Obx(() =>   GridView.builder(
      itemCount: controller.burgerList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
          childAspectRatio: 5/7,
    ), itemBuilder: (context, index) {


        try{
          return ProductCard(
            image: controller.burgerList[index].image![0],
            productName: controller.burgerList[index].name!,
            description:controller.burgerList[index].description!,
            totalRating: 5,
            deliveryTime: 15,
            rating: 4.85,
            isFavorite:controller.burgerList[index].isFavourite!,
            onFavorite: (){
              print(controller.burgerList[index].isFavourite!);
              controller.burgerFavorite(isFavorites:controller.burgerList[index].isFavourite = !controller.burgerList[index].isFavourite!, productID:controller.burgerList[index].id!,);

               if(controller.burgerList[index].isFavourite! == true){
                 controller.addToFavorite(
                                    context: context,
                                    productID: controller.burgerList[index].id!,
                                    image: controller.burgerList[index].image![0],
                                    price:double.parse(controller.burgerList[index].price.toString()),
                                    name: controller.burgerList[index].name!,
                                    description: controller.burgerList[index].description,
                                  );
                                }else{
                                    controller.deleteFavorite(productID:controller.burgerList[index].id!,context: context );
                                }


            },
            productId:controller.burgerList[index].id!,
            price:double.parse(controller.burgerList[index].price!) ,
            onTap: () {
              Get.to(() => DetailsScreen(
                productDataList: controller.burgerList[index],
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
