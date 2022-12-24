import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';

class GetProductController extends GetxController {
  final String? filedName;
  GetProductController({this.filedName});
  var productDataList = [].obs;
  var isLoading = false.obs;
  void loading() => isLoading.value = !isLoading.value;
  @override
  void onInit() {
    productData();
    super.onInit();
  }

  Future<void> productData() async {
    loading();
    try {
      QuerySnapshot data =
      await FirebaseFirestore.instance.collection(filedName!).get();
      productDataList.clear();
      for (var d in data.docs) {
        productDataList.add(ProductDataList.fromMap(d));
      }
      loading();
      print(await productDataList.length);
    } catch (error) {
      loading();
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM, "Error", "Error is: $error");
      Get.back();
    }
  }

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <deleteProduct> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  Future<void> deleteProduct({
    required String id,
    int? index,
  }) async {
    await FirebaseFirestore.instance
        .collection(filedName!)
        .doc(id)
        .delete()
        .whenComplete(() {
      Get.snackbar("Success", "Product Delete successful.",
          backgroundColor: Colors.green.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(
            Icons.cloud_done_outlined,
            size: 32,
          ),
          snackPosition: SnackPosition.BOTTOM);
      Future.delayed(const Duration(milliseconds: 500));
      productDataList.removeAt(index!);
    }).onError((error, stackTrace) => Get.snackbar("Error", error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 20)));

    print("deleteFireBaseStorageItem .................");
  }
}