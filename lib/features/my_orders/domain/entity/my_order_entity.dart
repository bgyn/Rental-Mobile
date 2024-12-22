import 'package:json_annotation/json_annotation.dart';

part 'my_order_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MyOrderEntity {
  final int? id;
  final int? userId;
  final int? rentItem;
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? totalPrice;
  final String? status;

  MyOrderEntity({
    this.id,
    this.title,
    this.endDate,
    this.startDate,
    this.rentItem,
    this.status,
    this.totalPrice,
    this.userId,
  });

  factory MyOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$MyOrderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MyOrderEntityToJson(this);

  static List<MyOrderEntity> fromJsonList(List? json) {
    return json?.map((e) => MyOrderEntity.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is MyOrderEntity) {
      return other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        rentItem.hashCode ^
        title.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        status.hashCode ^
        totalPrice.hashCode;
  }
}
