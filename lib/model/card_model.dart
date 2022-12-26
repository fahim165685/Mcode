import 'package:cloud_firestore/cloud_firestore.dart';

class CardList {
  String? id;
  String? name;
  double? price;
  String? addDate;
  String? image;
  int? quantity;

  CardList(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.addDate,
        this.quantity,
      });

  CardList.fromMap(DocumentSnapshot data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    addDate = data['AddDate'];
    quantity = data['quantity'];
    image = data['image'];
  }
}
