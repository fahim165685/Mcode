import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

class UpdateProductController extends GetxController {


  TextEditingController productNameCTR = TextEditingController();
  TextEditingController productPriceCTR = TextEditingController();
  TextEditingController makingTimeCTR = TextEditingController();
  TextEditingController deliveryTimeCTR = TextEditingController();
  TextEditingController productKcalCTR = TextEditingController();
  TextEditingController productDescriptionCTR = TextEditingController();

  void controllerClear(){
    productNameCTR.clear();
    productPriceCTR.clear();
    makingTimeCTR.clear();
    deliveryTimeCTR.clear();
    productKcalCTR.clear();
    productDescriptionCTR.clear();
  }

  String productName = '';
  String productPrice = '';
  String makingTime = '';
  String deliveryTime = '';
  String productKcal = '';
  String productDescription = '';

  Future loadingSpinner() async {
    Get.dialog(
        barrierDismissible: false,
        Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/icons/MCB_Icon.png",
                color: Colors.white,
                width: Get.width * 0.35,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ));
  }


  Future<void> productUpdateController({String? collectionName, ProductDataList? productDataList}) async {
    loadingSpinner();
    if (productNameCTR.text == '') {
      productName = productDataList!.name.toString();
    } else {
      productName = productNameCTR.text;
    }
    if (productPriceCTR.text == '') {
      productPrice = productDataList!.price.toString();
    } else {
      productPrice = productPriceCTR.text;
    }

    if (makingTimeCTR.text == '') {
      makingTime = productDataList!.makingTime.toString();
    } else {
      makingTime = makingTimeCTR.text;
    }

    if (deliveryTimeCTR.text == '') {
      deliveryTime = productDataList!.deliveryTime.toString();
    } else {
      deliveryTime = deliveryTimeCTR.text;
    }

    if (productKcalCTR.text == '') {
      productKcal = productDataList!.kilocalorie.toString();
    } else {
      productKcal = productKcalCTR.text;
    }
    if (productDescriptionCTR.text == '') {
      productDescription = productDataList!.description.toString();
    } else {
      productDescription = productDescriptionCTR.text;
    }


    try {

      var response = FirebaseFirestore.instance.collection(collectionName!.toString());
      await response.doc(productDataList!.id).update({
        'name': productName,
        'price': productPrice,
        'makingTime': makingTime,
        'deliveryTime': deliveryTime,
        'description': productDescription,
        'kilocalorie': productKcal,
      });
      print("<<>>><>>>>>>>2>$collectionName<<<<<<<<<<<<<<<<<<<<<<<<<<");
      Get.back();
      Future.delayed(const Duration(milliseconds: 300));
      controllerClear();
      Get.back();
      Get.snackbar("Success", "Product update successful.",
          backgroundColor: Colors.green.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(
            Icons.cloud_done_outlined,
            size: 32,
          ),
          snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.back();
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 20));
    }
  }
}
