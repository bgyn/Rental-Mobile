// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      profiePic: json['profiePic'] as String?,
      aboutYou: json['aboutYou'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'phone': instance.phone,
      'profiePic': instance.profiePic,
      'aboutYou': instance.aboutYou,
      'gender': instance.gender,
      'dob': instance.dob,
    };
