import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final double distance;
  final double rating;
  final double star;
  final String uId;
  final String productId;

  FavoriteModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.uId,
    required this.productId,
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
      };

  static FavoriteModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return FavoriteModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      uId: snapShot['uId'],
      productId: snapShot['productId'],
    );
  }


}
