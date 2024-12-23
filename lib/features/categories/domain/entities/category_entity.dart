import 'package:json_annotation/json_annotation.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

part 'category_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryEntity {
  final int? id;
  final String? categoryName;
  final List<RentitemEntity>? rentCategory;

  CategoryEntity(this.id, this.categoryName, this.rentCategory);

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);

  static List<CategoryEntity> fromJsonList(List? json) {
    return json?.map((e) => CategoryEntity.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is CategoryEntity) {
      return other.id == id;
    }
    return false;
  }

  @override
  int get hashCode {
    return id.hashCode ^ categoryName.hashCode;
  }
}
