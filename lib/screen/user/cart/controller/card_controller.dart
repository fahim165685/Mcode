import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:mcode/model/card_model.dart';

class CardController extends GetxController{
  DateTime now = DateTime.now();
  RxList<CardList> cardList= RxList<CardList>([]);

  FirebaseAuth auth =FirebaseAuth.instance;
  late CollectionReference collectionReference;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    cardData();
    cardList.bindStream(cardData());
    super.onInit();
  }

  Stream<List<CardList>> cardData()=> firebaseFireStore.collection("UserProfile").doc(auth.currentUser!.uid).collection("MyCard").snapshots().map((query) =>
          query.docs.map((item) => CardList.fromMap(item)).toList(),
    );

  ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Delete Favorite> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<void> deleteCard({ String? productID,BuildContext? context})async {
    loadingSpinner ();
    try{
      await firebaseFireStore.collection("UserProfile").doc(auth.currentUser!.uid).collection("MyCard").doc(productID).delete().then((value) {
        Get.back();
        customSnackBar(
            title: "Success",
            context:context!,
            massage: "Favorite card has been removed",
            contentType: ContentType.help
        );
        print("<<<<<<<<<<<<<<<<<<<<Delete Success>>>>>>>>>>>>>>>>>>>>");
      }).onError((error, stackTrace) {
        customSnackBar(
            title: "Error",
            context:context!,
            massage: "Something was wrong, please try again",
            contentType: ContentType.failure
        );
        print(error);
      });
    }catch(error){
      customSnackBar(
          title: "Error",
          context:context!,
          massage: "Something was wrong, please try again",
          contentType: ContentType.failure
      );
      Get.snackbar("Oops Error", "$error",snackPosition: SnackPosition.BOTTOM,);
      print(error);
    }

  }

  /// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <addToCard> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<void> addToCard({String? productID,String? name, double? price, String? image,BuildContext? context})async{
    loadingSpinner ();
    try{
      await firebaseFireStore.collection("UserProfile").doc(auth.currentUser!.uid).collection("MyCard").doc(productID).set({
        'AddDate':DateTime(now.year, now.month, now.day).toString(),
        'id':productID,
        'image':image,
        'name':name,
        'price':price,
        'quantity':1.toInt()
      }).then((value) {
        Get.back();
        customSnackBar(
            title: "Success",
            context:context!,
            massage: "Your product has been added to the card",
            contentType: ContentType.success
        );
        print("<<<<<<<<<<<<<<<<<<<<Success>>>>>>>>>>>>>>>>>>>>");
      }).onError((error, stackTrace) {
        customSnackBar(
            title: "Error",
            context:context!,
            massage: "Something was wrong, please try again",
            contentType: ContentType.failure
        );
        print(error);
      });
    }catch(error){
      customSnackBar(
          title: "Error",
          context:context!,
          massage: "Something was wrong, please try again",
          contentType: ContentType.failure
      );
      Get.snackbar("Oops Error", "$error");
      print(error);
    }
  }


  ///Loading
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
}