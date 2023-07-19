import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final double distance;
  final double rating;
  final double star;
  final String uId;
  final String productId;
  final int itemCount;

  CartModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.uId,
    required this.productId,
    required this.itemCount,
  });

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "distance": distance,
        "rating": rating,
        "star": star,
        "uId":uId,
        'productId':productId,
        'itemCount':itemCount,
      };

  static CartModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return CartModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      uId: snapShot['uId'],
      productId: snapShot['productId'],
      itemCount:snapShot['itemCount'],
    );
  }


}
