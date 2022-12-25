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

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<ProductDataList> getData= RxList<ProductDataList>([]);

  @override
  void onInit() {
    collectionReference =firebaseFireStore.collection(filedName!);
    getData.bindStream(getDataOn());
    print(getData.length);
    //productData();
    super.onInit();
  }

    Stream<List<ProductDataList>> getDataOn()=>
        collectionReference.snapshots().map((query) =>
            query.docs.map((item) => ProductDataList.fromMap(item)).toList()
        );
  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <deleteProduct> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  Future<void> deleteProduct({
    required String id,
    int? index,
  }) async {
    await FirebaseFirestore.instance
        .collection(filedName!).doc(id).delete()
        .whenComplete(() {
      Get.snackbar("Success", "Product Delete successful.",
          backgroundColor: Colors.green.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(
            Icons.cloud_done_outlined,
            size: 32,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }).onError((error, stackTrace) => Get.snackbar("Error", error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 20)));
    print("deleteFireBaseStorageItem .................");
  }
}