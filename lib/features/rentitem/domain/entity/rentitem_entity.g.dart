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
      quantity: (json['quantity'] as num?)?.toInt(),
      rating: json['rating'] as String?,
      numOfReviews: (json['numOfReviews'] as num?)?.toInt(),
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      itemRules: (json['itemRules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RentitemEntityToJson(RentitemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'thumbnailImage': instance.thumbnailImage,
      'description': instance.description,
      'quantity': instance.quantity,
      'rating': instance.rating,
      'numOfReviews': instance.numOfReviews,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'itemRules': instance.itemRules,
    };
