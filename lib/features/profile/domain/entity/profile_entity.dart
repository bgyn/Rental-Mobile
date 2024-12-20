import 'package:json_annotation/json_annotation.dart';

part 'profile_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileEntity {
  final int? id;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? address;
  final String? phone;
  final String? profilePic;
  final String? aboutYou;
  final String? gender;
  final String? dateOfBirth;
  ProfileEntity(
      {this.id,
      this.email,
      this.firstname,
      this.lastname,
      this.address,
      this.phone,
      this.profilePic,
      this.aboutYou,
      this.dateOfBirth,
      this.gender});

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
        profilePic.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        aboutYou.hashCode;
  }
}
