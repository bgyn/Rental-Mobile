import 'dart:convert';

List<RentitemEntity> rentitemEntityFromMap(String str) =>
    List<RentitemEntity>.from(
        json.decode(str).map((x) => RentitemEntity.fromMap(x)));

String rentitemEntityToMap(List<RentitemEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RentitemEntity {
  final int? id;
  final String? title;
  final String? price;
  final String? thumbnailImage;
  final String? description;
  final int? quantity;
  final String? rating;
  final int? numOfReviews;
  final String? address;
  final String? latitude;
  final String? longitude;
  final List<String>? itemRules;

  RentitemEntity({
    this.id,
    this.title,
    this.price,
    this.thumbnailImage,
    this.description,
    this.quantity,
    this.rating,
    this.numOfReviews,
    this.address,
    this.latitude,
    this.longitude,
    this.itemRules,
  });

  factory RentitemEntity.fromMap(Map<String, dynamic> json) => RentitemEntity(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        thumbnailImage: json["thumbnailImage"],
        description: json["description"],
        quantity: json["quantity"],
        rating: json["rating"],
        numOfReviews: json["numOfReviews"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        itemRules: json["itemRules"] == null
            ? []
            : List<String>.from(json["itemRules"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "thumbnailImage": thumbnailImage,
        "description": description,
        "quantity": quantity,
        "rating": rating,
        "numOfReviews": numOfReviews,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "itemRules": itemRules == null
            ? []
            : List<dynamic>.from(itemRules!.map((x) => x)),
      };
}
