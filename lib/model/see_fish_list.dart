import 'package:cloud_firestore/cloud_firestore.dart';

class SeeFishList {
  String? id;
  String? name;
  String? price;
  String? makingTime;
  String? deliveryTime;
  String? description;
  String? kilocalorie;
  List? image;

  SeeFishList(
      {this.id,
        this.name,
        this.price,
        this.description,
        this.deliveryTime,
        this.kilocalorie,
        this.makingTime,
        this.image});

  SeeFishList.fromMap(DocumentSnapshot data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    makingTime = data['makingTime'];
    deliveryTime = data['deliveryTime'];
    kilocalorie = data['kilocalorie'];
    description = data['deliveryTime'];
    image = data['Img'];
  }
}
