import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteList {
  String? id;
  String? name;
  double? price;
  String? addDate;
  String? image;
  String? description;
  int? quantity;

  FavoriteList(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.addDate,
        this.quantity,
        this.description
      });

  FavoriteList.fromMap(DocumentSnapshot data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    addDate = data['AddDate'];
    quantity = data['quantity'];
    description= data['description'];
    image = data['image'];
  }
}
