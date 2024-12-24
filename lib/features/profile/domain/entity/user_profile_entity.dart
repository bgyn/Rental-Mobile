import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_profile_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfileEntity {
  final String? name;
  final String? profilePic;
  final String? address;
  final String? phone;
  final List<RentitemEntity>? rentItems;
  UserProfileEntity({
    this.name,
    this.profilePic,
    this.address,
    this.phone,
    this.rentItems,
  });

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileEntityToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return false;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        rentItems.hashCode;
  }
}
