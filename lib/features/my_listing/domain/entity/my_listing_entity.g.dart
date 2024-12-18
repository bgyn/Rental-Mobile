// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_listing_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListingEntity _$MyListingEntityFromJson(Map<String, dynamic> json) =>
    MyListingEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$MyListingEntityToJson(MyListingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'image': instance.image,
    };
