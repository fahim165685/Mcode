import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';

class GetProductController extends GetxController {
   var burgerList = [].obs;
   var beefList = [].obs;
   var seeFishList = [].obs;
   var pizzaList = [].obs;
   var chickenList = [].obs;
   var kacchiList = [].obs;
   var drinksList = [].obs;

   @override
   void onInit() {
      burgerData();
      beefData();
      seeFishData();
      pizzaData();
      chickenData();
      kacchiData();
      drinksData();
      super.onInit();
   }
   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Burger> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> burgerData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('burger').get();
         burgerList.clear();
         for (var d in data.docs) {
            burgerList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error", "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Beef> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> beefData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('beef').get();
        // beefList.clear();
         for (var d in data.docs) {
            beefList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error", "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <See Fish> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> seeFishData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('seeFish').get();
         seeFishList.clear();
         for (var d in data.docs) {
            seeFishList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error", "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Pizza> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> pizzaData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('pizza').get();
         pizzaList.clear();
         for (var d in data.docs) {
            pizzaList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error", "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Chicken> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> chickenData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('chicken').get();
         chickenList.clear();
         for (var d in data.docs) {
            chickenList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error",
             "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <kacchi> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> kacchiData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data =
         await FirebaseFirestore.instance.collection('kacchi').get();
         kacchiList.clear();
         for (var d in data.docs) {
            kacchiList.add(ProductDataList.fromMap(d));
         }
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error",
             "Error is: $error");
         Get.back();
      }
   }

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <drinks> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Future<void> drinksData() async {
      print("object>>>>>>>>>>>>>>>>>>>1");
      try {
         QuerySnapshot data = await FirebaseFirestore.instance.collection('drinks').get();
         drinksList.clear();
         for (var d in data.docs) {
            drinksList.add(ProductDataList.fromMap(d));
         }
         print("${drinksList.length}>>>>>>>>>>>>>>>>>>>1");
      } catch (error) {
         Get.snackbar(
             snackPosition: SnackPosition.BOTTOM, "Error",
             "Error is: $error");
         Get.back();
      }
   }
}