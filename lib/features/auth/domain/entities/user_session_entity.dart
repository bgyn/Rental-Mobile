import 'package:json_annotation/json_annotation.dart';

part 'user_session_entity.g.dart';

@JsonSerializable()
class UserSessionEntity {
  final String? token;
  final bool? isAdmin;
  UserSessionEntity({
    this.token,
    this.isAdmin,
  });

  factory UserSessionEntity.fromJson(Map<String,dynamic> json)=> _$UserSessionEntityFromJson(json);

  Map<String,dynamic> toJson() => _$UserSessionEntityToJson(this);

  @override
  bool operator ==(Object other) {
    if(identical(this, other))
    {
      return true;
    }
    if(other.runtimeType != runtimeType){
      return false;
    }
    if(other is UserSessionEntity){
      return other.token == token;
    }
    return false;
  }
  
  @override
  int get hashCode {
    return token.hashCode ^ isAdmin.hashCode;
  }
  
}
