import 'package:json_annotation/json_annotation.dart';

part 'rentitem_entity.g.dart';

@JsonSerializable()
class RentitemEntity {
  final int? id;
  final String? title;
  final String? price;
  final String? thumbnailImage;
  final String? description;
  final int? inStock;
  final String? rating;
  final int? numOfReviews;
  final String? address;
  final String? latitude;
  final String? longitude;
  final int? owner;
  final String? rules;
  RentitemEntity({
    this.id,
    this.title,
    this.price,
    this.thumbnailImage,
    this.description,
    this.inStock,
    this.rating,
    this.numOfReviews,
    this.address,
    this.latitude,
    this.longitude,
    this.rules,
    this.owner,
  });

  factory RentitemEntity.fromJson(Map<String, dynamic> json) =>
      _$RentitemEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RentitemEntityToJson(this);

  static List<RentitemEntity> fromJsonList(List? json) {
    return json?.map((e) => RentitemEntity.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is RentitemEntity) {
      return other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        thumbnailImage.hashCode ^
        inStock.hashCode ^
        rating.hashCode ^
        numOfReviews.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        rules.hashCode;
  }
}
