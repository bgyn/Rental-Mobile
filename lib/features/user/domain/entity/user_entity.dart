import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? profilePic;
  final String? dob;

  UserEntity(this.id, this.firstName,this.lastName, this.email,this.address,this.profilePic,this.dob);

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
   
   Map<String,dynamic> toJson() => _$UserEntityToJson(this);

   @override
   bool operator ==(Object other){
    if(identical(this, other)){
      return true;
    }
    if(other.runtimeType != runtimeType){
      return false;
    }
    if(other is UserEntity){
      return other.id == id;
    }
    return false;
   }
   @override
  int get hashCode {
    return id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ address.hashCode ^ profilePic.hashCode ^ dob.hashCode;
  }
}
