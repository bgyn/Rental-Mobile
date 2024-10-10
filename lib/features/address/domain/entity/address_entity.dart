import 'package:json_annotation/json_annotation.dart';

part 'address_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressEntity {
  final String? lat;
  final String? lon;
  final String? displayName;

  AddressEntity({
    this.lat,
    this.lon,
    this.displayName,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);

  static List<AddressEntity> fromJsonList(List? json) {
    return json?.map((e) => AddressEntity.fromJson(e)).toList() ?? [];
  }
}
