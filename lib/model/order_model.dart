import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final double price;
  final String title;
  final String image;
  final DateTime date;
  final String productId;
  final String uId;
  final String selectedAddress;
  final bool orderRecived;
  final bool preparing;
  final bool outOfDelivery;
  final bool delivered;
  final int? itemCount;

  OrderModel({
    required this.price,
    required this.title,
    required this.date,
    required this.image,
    required this.productId,
    required this.uId,
    required this.orderRecived,
    required this.preparing,
    required this.outOfDelivery,
    required this.delivered,
    required this.selectedAddress,
    this.itemCount,
  });

  Map<String, dynamic> toJson() => {
        'price': price,
        'image': image,
        'date': date,
        'productId': productId,
        'uId': uId,
        'title': title,
        'orderRecived': orderRecived,
        'preparing': preparing,
        'outOfDelivery': outOfDelivery,
        'delivered': delivered,
        'selectedAddress': selectedAddress,
        'itemCount':itemCount,
      };
  static OrderModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return OrderModel(
      price: snapShot['price'],
      date: snapShot['date'],
      image: snapShot['image'],
      productId: snapShot['productId'],
      uId: snapShot['uId'],
      title: snapShot['title'],
      orderRecived: snapShot['orderRecived'],
      preparing: snapShot['preparing'],
      outOfDelivery: snapShot['outOfDelivery'],
      delivered: snapShot['delivered'],
      selectedAddress: snapShot['selectedAdress'],
      itemCount: snapShot['itemCount'],
    );
  }
}
