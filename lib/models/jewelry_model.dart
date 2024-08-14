import 'product_model.dart';

class Jewelry extends Product {
  Jewelry({
    required int id,
    required String title,
    required String image,
    required double price,
    required String description,
    required double ratingRate,
    required int ratingCount,
  }) : super(
          id: id,
          title: title,
          category: 'Jewelry',
          image: image,
          price: price,
          description: description,
          ratingRate: ratingRate,
          ratingCount: ratingCount,
        );

  factory Jewelry.fromJson(Map<String, dynamic> json) {
    return Jewelry(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'].toDouble(),
      description: json['description'],
      ratingRate: (json['rating']['rate'] is int) ? (json['rating']['rate'] as int).toDouble() : json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }
}
