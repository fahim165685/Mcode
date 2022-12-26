import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/constants.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HomePageController extends GetxController {
   var isFavorite = false.obs;
   DateTime now = DateTime.now();

   RxList<ProductDataList> burgerList = RxList<ProductDataList>([]);
   RxList<ProductDataList> beefList= RxList<ProductDataList>([]);
   RxList<ProductDataList> seeFishList= RxList<ProductDataList>([]);
   RxList<ProductDataList> pizzaList= RxList<ProductDataList>([]);
   RxList<ProductDataList> chickenList= RxList<ProductDataList>([]);
   RxList<ProductDataList> kacchiList= RxList<ProductDataList>([]);
   RxList<ProductDataList> drinksList= RxList<ProductDataList>([]);

   FirebaseAuth auth =FirebaseAuth.instance;
   late CollectionReference collectionReference;
   FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

   void favorite () =>isFavorite.value = !isFavorite.value ;
   @override
   void onInit() {
      burgerData();
      burgerList.bindStream(burgerData());

      beefData();
      beefList.bindStream(beefData());

      seeFishData();
      seeFishList.bindStream(seeFishData());

      pizzaData();
      pizzaList.bindStream(pizzaData());

      chickenData();
      chickenList.bindStream(chickenData());

      kacchiData();
      kacchiList.bindStream(kacchiData());

      drinksData();
      drinksList.bindStream(drinksData());
      super.onInit();
   }
   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Burger> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> burgerData()=>
       firebaseFireStore.collection('burger').snapshots().map((query) =>
       query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   Future<void> burgerFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('burger').doc(productID).update({
         'favorite':isFavorites,
      });
      //print(isFavorites);
   }


   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Beef> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> beefData()=>
       firebaseFireStore.collection('beef').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   //
   Future<void> beefFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('beef').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <See Fish> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> seeFishData()=>
       firebaseFireStore.collection('seeFish').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   //
   Future<void> seeFishFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('beef').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }
   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Pizza> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> pizzaData()=>
       firebaseFireStore.collection('pizza').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   //
   Future<void>  pizzaFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('pizza').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Chicken> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> chickenData()=>
       firebaseFireStore.collection('chicken').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   //
   Future<void>  chickenFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('chicken').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }


   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <kacchi> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> kacchiData()=>
       firebaseFireStore.collection('kacchi').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   Future<void>  kacchiFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('kacchi').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <drinks> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> drinksData()=>
       firebaseFireStore.collection('drinks').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
   Future<void>  drinksFavorite({bool? isFavorites,String? productID,}) async{
      await firebaseFireStore.collection('kacchi').doc(productID).update({
         'favorite':isFavorites,
      });
      print(isFavorites);
   }


   ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <addToFavorite> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   Future<void> addToFavorite({String? productID,String? name,String? description, double? price, String? image,BuildContext? context})async{
      loadingSpinner ();
      try{
         await firebaseFireStore.collection("UserProfile").doc(auth.currentUser!.uid).collection("MyFavorite").doc(productID).set({
            'AddDate':DateTime(now.year, now.month, now.day).toString(),
            'id':productID,
            'image':image,
            'name':name,
            'price':price,
            'description':description,
            'quantity':1.toInt(),
            'favorite':true,
         }).then((value) {
            Get.back();
            customSnackBar(
                title: "Success",
                context:context!,
                massage: "Your product has been added to Favorite",
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

   ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Delete Favorite> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   Future<void> deleteFavorite({ String? productID,BuildContext? context})async {
      loadingSpinner ();
      try{
         await firebaseFireStore.collection("UserProfile").doc(auth.currentUser!.uid).collection("MyFavorite").doc(productID).delete().then((value) {
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

   ///
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