import 'package:json_annotation/json_annotation.dart';

part 'my_listing_entity.g.dart';

@JsonSerializable()
class MyListingEntity {
  final String id;
  final String name;
  final String status;
  final String image;
  MyListingEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory MyListingEntity.fromJson(Map<String,dynamic> json)=> _$MyListingEntityFromJson(json);
  
  Map<String,dynamic> toJson()=> _$MyListingEntityToJson(this);

  static List<MyListingEntity> fromJsonList(List? json){
    return json?.map((e) => MyListingEntity.fromJson(e)).toList()??[];
  }


  @override
  bool operator ==(Object other) {
    if(identical(this,other)){
      return true;
    }
    if(other.runtimeType != runtimeType){
      return false;
    }
    if(other is MyListingEntity){
      other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode^
    name.hashCode^
    status.hashCode^
    image.hashCode;
  }
  
}
