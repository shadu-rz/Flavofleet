import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final double price; 
  final String title; 
  final String image;
  final DateTime date;
  final String productId;
  final String uId;
  OrderModel({
    required this.price,
    required this.title,
    required this.date,
    required this.image,
    required this.productId,
    required this.uId,
  });

  Map<String, dynamic> toJson() => {
        'price': price,
        'image': image,
        'date': date,
        'productId':productId,
        'uId':uId,
        'title':title,
      };
  static OrderModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return OrderModel(
      price: snapShot['price'],
      date: snapShot['date'],
      image: snapShot['image'],
      productId:snapShot['productId'],
      uId: snapShot['uId'],
      title: snapShot['title'],
    );
  }
}
