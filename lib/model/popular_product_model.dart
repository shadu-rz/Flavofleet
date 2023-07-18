import 'package:cloud_firestore/cloud_firestore.dart';

class PopularProductModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final double distance;
  final double rating;
  final double star;
  final double time;
  final String uId;
  final String productId;


  PopularProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.time,
    required this.uId,
    required this.productId
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "distance": distance,
        "rating": rating,
        "star": star,
        "time": time,
        "uId":uId,
        "productId":productId
      };

  static PopularProductModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return PopularProductModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      time: snapShot['time'],
      uId: snapShot['uId'],
      productId: snapShot['productId'],
    );
  }
}
