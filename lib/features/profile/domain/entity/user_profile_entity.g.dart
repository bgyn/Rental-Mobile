// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) =>
    UserProfileEntity(
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      rentItems: (json['rent_items'] as List<dynamic>?)
          ?.map((e) => RentitemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileEntityToJson(UserProfileEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_pic': instance.profilePic,
      'address': instance.address,
      'phone': instance.phone,
      'rent_items': instance.rentItems,
    };
