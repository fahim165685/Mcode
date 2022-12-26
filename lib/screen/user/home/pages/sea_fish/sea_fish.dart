import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/user/details_screen/details_screen.dart';
import 'package:mcode/screen/user/home/components/product_card.dart';
import 'package:mcode/screen/user/home/controller/home_page_controller.dart';

class SeaFish extends StatelessWidget {
  const SeaFish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller =Get.put(HomePageController());
    return Obx(() =>   GridView.builder(
      itemCount: controller.seeFishList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5/7,
      ), itemBuilder: (context, index) {
      if(controller.seeFishList.isEmpty){
        return const Center(child: CircularProgressIndicator());
      }

      try{
        return ProductCard(
          image: controller.seeFishList[index].image![0],
          productName: controller.seeFishList[index].name!,
          description:controller.seeFishList[index].description!,
          isFavorite:controller.seeFishList[index].isFavourite!,
          onFavorite: (){
            print(controller.seeFishList[index].isFavourite!);
            controller.burgerFavorite(isFavorites:controller.seeFishList[index].isFavourite = !controller.seeFishList[index].isFavourite!, productID:controller.seeFishList[index].id!,);
            if(controller.seeFishList[index].isFavourite! == true){
              controller.addToFavorite(
                context: context,
                productID: controller.seeFishList[index].id!,
                image: controller.seeFishList[index].image![0],
                price:double.parse(controller.seeFishList[index].price.toString()),
                name: controller.seeFishList[index].name!,
                description: controller.seeFishList[index].description,
              );
            }else{
              controller.deleteFavorite(productID:controller.seeFishList[index].id!,context: context );
            }
          },
          totalRating: 5,
          deliveryTime: 15,
          rating: 4.85,
          productId:controller.seeFishList[index].id!,
          price: double.parse(controller.seeFishList[index].price!.toString()) ,
          onTap: () {
            Get.to(() => DetailsScreen(
              productDataList: controller.seeFishList[index],
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
