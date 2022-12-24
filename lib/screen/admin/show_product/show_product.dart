import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/screen/admin/show_product/controller/show_produce_controller.dart';
import 'package:mcode/screen/admin/show_product/product_details_page.dart';

class ShowAllProduct extends StatefulWidget {
  const ShowAllProduct({Key? key}) : super(key: key);

  @override
  State<ShowAllProduct> createState() => _ShowAllProductState();
}

class _ShowAllProductState extends State<ShowAllProduct> {
  @override
  Widget build(BuildContext context) {
    ShowProductController controller = Get.put(ShowProductController());
    List item = [
      ["assets/icons/burger.svg",'Burger', 'burger'],
      ["assets/icons/pizza.svg", 'pizza', 'pizza'],
      ["assets/icons/sey-food.svg","SeeFish",'seeFish'],
      ["assets/icons/chicken.svg", "Chicken",'chicken'],
      ["assets/icons/rice.svg","Kacchi",'kacchi'],
      ["assets/icons/beef.svg","Beef",'beef'],
      ["assets/icons/drinks.svg","Drinks",'drinks'],
    ];


    return  ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        try {
          return Obx(() =>   itemCard(
            onTap: (){
              Get.to (()=> ProductDetailsPage(
                filedName: item[index][2],
              ));
              print(controller.productLengthList);
            },
            image: item[index][0],
            productName: item[index][1],
            totalProduct:(controller.productLengthList.length < 7 )? 0: controller.productLengthList[index],
          ));
        } catch (e) {
          return Text(e.toString());
        }
      },
    );
  }

  Widget itemCard({
    required VoidCallback onTap,
    required String image,
      required String productName,
      required int totalProduct}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap:onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
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
                child: SvgPicture.asset(image),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "You have $totalProduct products in your collection",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  flex: 1, child: Icon(Icons.arrow_forward_ios_rounded))
            ],
          ),
        ),
      ),
    );
  }

}
