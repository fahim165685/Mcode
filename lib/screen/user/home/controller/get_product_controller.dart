import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mcode/model/prodact_list.dart';

class GetProductController extends GetxController {
   FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

   RxList<ProductDataList> burgerList = RxList<ProductDataList>([]);
    RxList<ProductDataList> beefList= RxList<ProductDataList>([]);
   RxList<ProductDataList> seeFishList= RxList<ProductDataList>([]);
   RxList<ProductDataList> pizzaList= RxList<ProductDataList>([]);
   RxList<ProductDataList> chickenList= RxList<ProductDataList>([]);
   RxList<ProductDataList> kacchiList= RxList<ProductDataList>([]);
   RxList<ProductDataList> drinksList= RxList<ProductDataList>([]);

   late CollectionReference collectionReference;


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

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Beef> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> beefData()=>
       firebaseFireStore.collection('beef').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <See Fish> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> seeFishData()=>
       firebaseFireStore.collection('seeFish').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Pizza> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> pizzaData()=>
       firebaseFireStore.collection('pizza').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Chicken> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> chickenData()=>
       firebaseFireStore.collection('chicken').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <kacchi> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> kacchiData()=>
       firebaseFireStore.collection('kacchi').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );

   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <drinks> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
   Stream<List<ProductDataList>> drinksData()=>
       firebaseFireStore.collection('drinks').snapshots().map((query) =>
           query.docs.map((item) => ProductDataList.fromMap(item)).toList()
       );
}