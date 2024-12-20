import 'package:json_annotation/json_annotation.dart';

part 'profile_entity.g.dart';

@JsonSerializable()
class ProfileEntity {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? phone;
  final String? profiePic;
  final String? aboutYou;
  final String? gender;
  final String? dob;
  ProfileEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.phone,
    this.profiePic,
    this.aboutYou,
    this.dob,
    this.gender
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ProfileEntity) {
      other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        aboutYou.hashCode;
  }
}
