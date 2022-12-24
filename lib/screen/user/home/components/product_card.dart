import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/home/components/frosted_glass_box.dart';

class ProductCard extends StatefulWidget {
  final String image, productName;
  final int totalRating, deliveryTime;
  final double rating, price, height, width;
  final VoidCallback onTap;

  const ProductCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.totalRating,
      required this.deliveryTime,
      required this.rating,
      required this.price,
      required this.onTap,
      this.height=260,
      this.width=180
      });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: (widget.image.isEmpty)? const AssetImage("assets/icons/MCB_Icon.png"):  NetworkImage(widget.image) as ImageProvider , fit: BoxFit.cover),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          right: 0,
                          top: 0,
                          child: FrostedGlassBox(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              color:
                                  (isFavorite == true) ? Colors.red : Colors.white,
                              height: 40,
                              width: 40,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(8)),
                              child: (isFavorite == true)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red.shade400,
                                    )
                                  : const Icon(Icons.favorite_border)))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(widget.productName,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const Spacer(),
                //rating
                Row(
                  children: [
                     Icon(Icons.star,size: 18,color: Colors.yellow[700]),
                    Text(widget.rating.toString()),
                    const Text('/5 '),
                    Text("(${widget.totalRating}) "),
                    Icon(Icons.fiber_manual_record,size: 8,color: Colors.grey[400],),
                    const Text(" 25 Sold")
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("৳${widget.price}",style: const TextStyle(color: kPrimaryColor,fontSize: 22,fontWeight: FontWeight.w600)),
                ),
                const Spacer(),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 40,
                  width:40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                    ),
                    color: kPrimaryColor
                  ),
                  child: const Center(
                    child: Icon(Icons.shopping_cart_outlined,color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
