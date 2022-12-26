import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

class AddProductController extends GetxController{

  late firebase_storage.Reference ref;
  var isLoading = false.obs;
  void loading() => isLoading.value = !isLoading.value;
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Upload Field<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//

  //String id =DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> uploadData({
    required List<File> list,
    required String imagePath,
    required String collectionName,
        required String name,
        required double price,
        required String makingTime,
        required String deliveryTime,
        required String kcal,
        required String description}) async {
    loadingSpinner();
    CollectionReference user = FirebaseFirestore.instance.collection(collectionName);
    var response = await user.add({
      'name': name,
      'price': price,
      'makingTime': makingTime,
      'deliveryTime': deliveryTime,
      'description': description,
      'kilocalorie': kcal,
      'isFavourite':false,
    });
    uploadImg(id: response.id, images: list,imagePath: imagePath,collectionName:collectionName);


  }

  //loading
  Future loadingSpinner () async{
    Get.dialog(
      barrierDismissible: false,
        Stack(
          children:  [
            Center(
              child: Image.asset("assets/icons/MCB_Icon.png",color: Colors.white,width: Get.width*0.35,),
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
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Add image to collection filed<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
  upload({String? id, String? add,required String collectionName }) async {
    var response = FirebaseFirestore.instance.collection(collectionName);
    await response.doc(id).update({
      "id":id,
      'Img': FieldValue.arrayUnion([add])
    });
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Image upload Loop<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
  Future uploadImg({
    List<File>? images,
    String? id,
    String? imagePath,
    required String collectionName
  }) async {
    for (var img in images!) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref().child("product images/$imagePath/${DateTime.now()} ${path.basename(img.path)}");
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) async {
          upload(add: value, id: id,collectionName: collectionName);
        });
      });
    }
    loading();
    Get.back();
    Future.delayed(const Duration(milliseconds: 200));
    Get.back();
    Get.snackbar("Success","Product uploaded successfully",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.cloud_done_outlined,color: Colors.green,size: 40,),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: const Color(0xFFff5230).withOpacity(0.3)
    );
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>Upload Dine<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
  }
}