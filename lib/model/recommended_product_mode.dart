import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendedProductModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final double distance;
  final double rating;
  final double star;
  final String uId;

  RecommendedProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.uId,
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
      };

  static RecommendedProductModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return RecommendedProductModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      uId: snapShot['uId'],
    );
  }


}
