// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity(
      (json['id'] as num?)?.toInt(),
      json['category_name'] as String?,
      (json['rent_category'] as List<dynamic>?)
          ?.map((e) => RentitemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'rent_category': instance.rentCategory,
    };
