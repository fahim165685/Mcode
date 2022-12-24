import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/admin/update_product/controller/update_product_controller.dart';

class ProductUpdatePage extends StatelessWidget {
  const ProductUpdatePage({
    Key? key,
    this.collectionName,
    required this.productDataList,
  }) : super(key: key);
  final ProductDataList productDataList;
  final String? collectionName;

  @override
  Widget build(BuildContext context) {
    UpdateProductController controller = Get.put(UpdateProductController());
    return Container(
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.none,
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
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  size: 25,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
          const SizedBox(
            height: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          productDataList.image!.length,
                              (index) {
                            if(productDataList.name!.isEmpty){
                              return CircularProgressIndicator();
                            }
                            return   SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Image.network(productDataList.image![index],fit: BoxFit.cover,),
                              ),
                            );
                              }  )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _headLineText(headName: "Product Name"),
                _buildTextFormField(
                    hintText: productDataList.name,
                    controller: controller.productNameCTR,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: "Product Price"),
                            _buildTextFormField(
                                hintText: productDataList.price,
                                controller: controller.productPriceCTR
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: "Making Time"),
                            _buildTextFormField(
                              hintText:productDataList.makingTime,
                              keyboardType: TextInputType.number,
                              controller: controller.makingTimeCTR,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(  headName: "Delivery Time"),
                            _buildTextFormField(
                                hintText: productDataList.deliveryTime,
                                keyboardType: TextInputType.number,
                                controller:controller.deliveryTimeCTR
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: "kilocalories (kcal)"),
                            _buildTextFormField(
                                hintText: productDataList.kilocalorie,
                                keyboardType: TextInputType.number,
                                controller: controller.productKcalCTR),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                _headLineText(headName: "Description "),
                _buildTextFormField(
                    hintText: productDataList.description,
                    controller: controller.productDescriptionCTR,
                    maxLines: 6),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  text: "Update Now".toUpperCase(),
                  press: () {
                    controller.productUpdateController(collectionName: collectionName,productDataList:productDataList );
                  },
                )
              ])
        ],
      ),
    );
  }

  _headLineText({required String headName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        headName,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 14, color: kPrimaryColor),
      ),
    );
  }

  TextFormField _buildTextFormField(
      {TextEditingController? controller,
      String? hintText,
      TextInputType? keyboardType,
      int maxLines=1

      }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill out the form";
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPrimaryColor)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
