import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:mcode/screen/admin/add_product/components/product_img.dart';
import 'package:mcode/screen/admin/add_product/controller/add_product_controller.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({Key? key, this.imagePath,this.collectionName}) : super(key: key);
  final String? imagePath;
  final String? collectionName;
  @override
  Widget build(BuildContext context) {

    List<File> imageList =[];

    TextEditingController pNameCon = TextEditingController();
    TextEditingController pPriceCon = TextEditingController();
    TextEditingController pMakingTimeCon = TextEditingController();
    TextEditingController pDeliveryTimeCon = TextEditingController();
    TextEditingController pKcalCon = TextEditingController();
    TextEditingController pDescriptionCon = TextEditingController();

    AddProductController controller =Get.put(AddProductController());
    return GestureDetector(
      onTap:  () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(imagePath!.toUpperCase()),
          leading: CustomBorderIcon(
            press: () {
              Get.back();
            },
          ),
        ),
        body:  Form(
            key: kFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImage(
                      list: imageList,
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFormField(
                      controller: pNameCon,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Product Name*";
                        }
                        return null;
                      },
                      labelText: "Product Name",
                    ),
                    CustomTextFormField(
                      controller: pPriceCon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product Price*";
                        }
                        return null;
                      },
                      labelText: "Product Price",
                    ),
                    CustomTextFormField(
                      controller: pMakingTimeCon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Making Time*";
                        }
                        return null;
                      },
                      labelText: "Making Time",
                    ),
                    CustomTextFormField(
                      controller: pDeliveryTimeCon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Delivery Time*";
                        }
                        return null;
                      },
                      labelText: "Delivery Time",
                    ),
                    CustomTextFormField(
                      controller: pKcalCon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product kcal*";
                        }
                        return null;
                      },
                      labelText: "Product Kcal",
                    ),
                    CustomTextFormField(
                      maxLines: 5,
                      controller: pDescriptionCon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product Description*";
                        }
                        return null;
                      },
                      labelText: "Product Description",
                    ),
                    DefaultButton(text: "Submit", press: (){
                      final formKey= kFormKey.currentState!.validate();
                      if(formKey){
                        if(imageList.isEmpty){
                          customSnackBar(
                            context: context,
                            title: "Warning".toUpperCase(),
                            massage: "Please add your product image ",
                            contentType: ContentType.failure,
                          );
                        }else if(imageList.length < 2){
                          customSnackBar(
                            context: context,
                            title: "Warning".toUpperCase(),
                            massage: "Please add a minimum of 3 images of your product",
                            contentType: ContentType.help,
                          );

                        } else{
                          controller.uploadData(
                              list: imageList,
                              imagePath: imagePath!,
                              collectionName:collectionName! ,
                              name: pNameCon.text,
                              price: pPriceCon.text,
                              makingTime: pMakingTimeCon.text,
                              deliveryTime: pDeliveryTimeCon.text,
                              kcal: pKcalCon.text,
                              description: pDescriptionCon.text
                          );
                        }
                      }
                    }
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
