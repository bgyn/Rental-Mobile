import 'package:json_annotation/json_annotation.dart';

part 'rentals_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentalsEntity {
  final int? id;
  final int? userId;
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? totalPrice;
  final String? status;

  RentalsEntity({
    this.id,
    this.userId,
    this.title,
    this.startDate,
    this.endDate,
    this.totalPrice,
    this.status,
  });

  factory RentalsEntity.fromJson(Map<String, dynamic> json) =>
      _$RentalsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RentalsEntityToJson(this);
  static List<RentalsEntity> fromJsonList(List? json) {
    return json?.map((e) => RentalsEntity.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is RentalsEntity) {
      return other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        totalPrice.hashCode ^
        status.hashCode;
  }
}
