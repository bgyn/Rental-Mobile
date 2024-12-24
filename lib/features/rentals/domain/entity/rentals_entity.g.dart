// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentals_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentalsEntity _$RentalsEntityFromJson(Map<String, dynamic> json) =>
    RentalsEntity(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      totalPrice: json['total_price'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RentalsEntityToJson(RentalsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_price': instance.totalPrice,
      'status': instance.status,
    };
