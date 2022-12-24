import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/model/prodact_list.dart';

class ProductImage extends StatefulWidget {
  final ProductDataList productDataList;
  const ProductImage({
    Key? key, required this.productDataList,
  }) : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  List imbage = [
    "assets/images/bergar.png",
    "assets/images/berger_2.png",
    "assets/images/berger_3.png",
    "assets/images/berger_4.png",
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.productDataList.image![selectedIndex]),fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(widget.productDataList.image!.length, (index) => buildSmallPreview(index))
              ],
            ),
          )),
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(color: selectedIndex == index? kPrimaryColor:Colors.transparent),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage( widget.productDataList.image![index]),fit: BoxFit.cover)),
      ),
    );
  }
}
