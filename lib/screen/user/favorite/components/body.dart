import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/screen/user/favorite/components/favorite_card.dart';
import 'package:mcode/screen/user/favorite/controller/favorite_controller.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    return Obx(() => (controller.favoriteList.isEmpty)? itemIsEmpty():  ListView.builder(
      itemCount: controller.favoriteList.length,
      itemBuilder: (context, index) => FavoriteCard(
        onAddToCard: (){
          controller.addToCard(
            productID: controller.favoriteList[index].id!,
            context: context,
            name: controller.favoriteList[index].name!,
            image: controller.favoriteList[index].image!,
            price: controller.favoriteList[index].price!
          );
        },
        onRemove: (){
          controller.deleteFavorite(
            context: context,
            productID: controller.favoriteList[index].id!
          );
        },
        image: controller.favoriteList[index].image!,
        price: controller.favoriteList[index].price!,
        productDescription: controller.favoriteList[index].description!,
        productName: controller.favoriteList[index].name!,
      ),
    ));
  }

  SizedBox itemIsEmpty() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/images/empty_list.png",
            width: Get.width * 0.8,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DefaultButton(text: "Explore Food", press: () {}),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


