// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderEntity _$MyOrderEntityFromJson(Map<String, dynamic> json) =>
    MyOrderEntity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      endDate: json['end_date'] as String?,
      startDate: json['start_date'] as String?,
      rentItem: (json['rent_item'] as num?)?.toInt(),
      status: json['status'] as String?,
      totalPrice: json['total_price'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyOrderEntityToJson(MyOrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'rent_item': instance.rentItem,
      'title': instance.title,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_price': instance.totalPrice,
      'status': instance.status,
    };
