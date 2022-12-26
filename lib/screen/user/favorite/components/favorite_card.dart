import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';

class FavoriteCard extends StatelessWidget {
  final String image, productName, productDescription;
  final VoidCallback onRemove, onAddToCard;
  final double price ;

  const FavoriteCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.productDescription,
      required this.price,
      required this.onRemove,
      required this.onAddToCard});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 140,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ///image
          Expanded(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: -15,
                    child: Center(
                      child: Card(
                        elevation: 5,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                            radius: 50, backgroundImage: NetworkImage(image)),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(width: 10,),
          //name ,price ,etc
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 1,
                      style: const TextStyle(
                          color: kTextLiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(productDescription),
                    Text(
                      "৳$price",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                    ),
                  ])),
          //button
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: onRemove,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: const Icon(Icons.remove,
                              color: Colors.white, size: 25),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: onAddToCard,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.circular(10)),
                          ),
                          child: const Icon(Icons.shopping_cart_outlined,
                              color: Colors.white, size: 25),
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
