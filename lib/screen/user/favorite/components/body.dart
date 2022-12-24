import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/screen/user/favorite/components/favorite_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FavoriteCard()
        FavoriteCard(
          onAddToCard: (){},
            onRemove: (){},
            press: (){},
            image: "assets/images/pizza.png",
            price: 890,
            productDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting",
            productName: "Margherita Pizza",
            rating: 4.5,
            totalSel: 20,
          ),
        FavoriteCard(
          onAddToCard: (){},
          onRemove: (){},
          press: (){},
          image: "assets/images/Kachchi.png",
          price: 299,
          productDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting",
          productName: "Beef Kacchi",
          rating: 4.5,
          totalSel: 20,
        ),
        FavoriteCard(
          onAddToCard: (){},
          onRemove: (){},
          press: (){},
          image: "assets/images/drikns.png",
          price: 160,
          productDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting",
          productName: "Drinks",
          rating: 4.5,
          totalSel: 20,
        ),

      ],
    );
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


