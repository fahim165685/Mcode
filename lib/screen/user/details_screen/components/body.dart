import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/user/details_screen/components/product_image.dart';


class Body extends StatelessWidget {
  const Body({Key? key, required this.productDataList}) : super(key: key);
  final ProductDataList productDataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ProductImage(productDataList: productDataList),
          const SizedBox(
            height: 30,
          ),
          ///total order & price & favorite
           const Padding(
             padding: EdgeInsets.only(left: 25),
             child: TotalOrder(),
           ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Beef Burger",
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35)),
          ),
          const SizedBox(
            height: 20,
          ),
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
              maxLines: 3,
              textAlign: TextAlign.justify,
          ),
           ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.delivery_dining_outlined,
                            color: Colors.yellow[800],
                            size: 25,
                          )),
                      const TextSpan(text: " 30 Mint"),
                    ])),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.local_fire_department,
                            color: Colors.yellow[900],
                            size: 25,
                          )),
                      const TextSpan(text: "100 Kcal"),
                    ])),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.access_time_filled,
                            color: kPrimaryColor.withOpacity(0.9),
                            size: 25,
                          )),
                      const TextSpan(text: " 5-10 Min"),
                    ])),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: DefaultButton(
                      text: "Bay Now", press: () {}),
                ),
                const SizedBox(width: 10,),
                Expanded(flex:1,child: ElevatedButton(
                    onPressed: (){

                      customSnackBar(
                        title: "Success",
                        massage:"Add to Card Success",
                        contentType: ContentType.help,
                        context: context,
                      );

                    },
                    style: ButtonStyle(
                      backgroundColor:  const MaterialStatePropertyAll(kPrimaryColor),
                      shape:const MaterialStatePropertyAll(CircleBorder()),
                     padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20, horizontal: 20),),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined)))
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class TotalOrder extends StatefulWidget {
  const TotalOrder({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalOrder> createState() => _TotalOrderState();
}

class _TotalOrderState extends State<TotalOrder> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            buildButton(
                icon: Icons.remove,
                onTap: () {}),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "X1",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 5,
            ),
            buildButton(
                icon: Icons.add,
                onTap: () {}),
          ],
        ),


        const Text("৳350",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            decoration: BoxDecoration(
                color: isFavorite == true ? Colors.white : Colors.red[100],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: isFavorite == true
                ? const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.grey,
                  )
                : const Icon(Icons.favorite, color: Colors.red),
          ),
        )
      ],
    );
  }

  InkWell buildButton({required VoidCallback onTap, required IconData icon}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
            )),
        child: Icon(icon),
      ),
    );
  }
}
