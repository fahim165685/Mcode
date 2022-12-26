import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/add_product/components/add_product_form.dart';

class SelectProductOptionsScreen extends StatelessWidget {
  const SelectProductOptionsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List img = [
      ["assets/icons/burger.svg", "burger", "burger"],
      ["assets/icons/pizza.svg", "pizza", "pizza" ],
      ["assets/icons/sey-food.svg","seeFish",'seeFish'],
      ["assets/icons/chicken.svg", "chicken", 'chicken'],
      ["assets/icons/rice.svg","kacchi", 'kacchi'],
      ["assets/icons/beef.svg","beef", 'beef'],
      ["assets/icons/drinks.svg","drinks", 'drinks'],

    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: img.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => itemCard(
                onTap: () {
                  Get.off(
                      AddProductForm(
                          imagePath: img[index][1],
                          collectionName: img[index][2]),
                      duration: const Duration(seconds: 1));
                },
                image: img[index][0]),
          )
        ],
      ),
    );
  }

  InkWell itemCard({required VoidCallback onTap, required String image}) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(3, 8),
                  blurRadius: 5)
            ]),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
