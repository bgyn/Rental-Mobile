// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      userId: (json['user_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      profilePic: json['profile_pic'] as String?,
      aboutYou: json['about_you'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'address': instance.address,
      'phone': instance.phone,
      'profile_pic': instance.profilePic,
      'about_you': instance.aboutYou,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
    };
