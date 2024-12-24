import 'package:json_annotation/json_annotation.dart';

part 'my_listing_entity.g.dart';

@JsonSerializable()
class MyListingEntity {
  final int? id;
  final String? title;
  final String? price;
  final String thumbnailImage;
  final int? inStock;
  final String? description;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? rules;
  final int? category;
  final String? status;
  MyListingEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnailImage,
    required this.description,
    required this.inStock,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rules,
    required this.category,
    required this.status,
  });

  factory MyListingEntity.fromJson(Map<String, dynamic> json) =>
      _$MyListingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyListingEntityToJson(this);

  static List<MyListingEntity> fromJsonList(List? json) {
    return json?.map((e) => MyListingEntity.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is MyListingEntity) {
      other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        thumbnailImage.hashCode ^
        description.hashCode ^
        inStock.hashCode ^
        address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        rules.hashCode ^
        category.hashCode ^
        status.hashCode;
  }
}
