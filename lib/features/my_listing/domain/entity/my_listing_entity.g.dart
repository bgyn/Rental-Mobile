// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_listing_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListingEntity _$MyListingEntityFromJson(Map<String, dynamic> json) =>
    MyListingEntity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: json['price'] as String?,
      thumbnailImage: json['thumbnailImage'] as String,
      description: json['description'] as String?,
      inStock: (json['inStock'] as num?)?.toInt(),
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      rules: json['rules'] as String?,
      category: (json['category'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MyListingEntityToJson(MyListingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'thumbnailImage': instance.thumbnailImage,
      'inStock': instance.inStock,
      'description': instance.description,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rules': instance.rules,
      'category': instance.category,
      'status': instance.status,
    };
