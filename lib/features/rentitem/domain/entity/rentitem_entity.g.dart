// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentitem_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentitemEntity _$RentitemEntityFromJson(Map<String, dynamic> json) =>
    RentitemEntity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: json['price'] as String?,
      thumbnailImage: json['thumbnailImage'] as String?,
      description: json['description'] as String?,
      inStock: (json['inStock'] as num?)?.toInt(),
      rating: json['rating'] as String?,
      numOfReviews: (json['numOfReviews'] as num?)?.toInt(),
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      itemRules: (json['itemRules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RentitemEntityToJson(RentitemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'thumbnailImage': instance.thumbnailImage,
      'description': instance.description,
      'inStock': instance.inStock,
      'rating': instance.rating,
      'numOfReviews': instance.numOfReviews,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'userId': instance.userId,
      'itemRules': instance.itemRules,
    };
