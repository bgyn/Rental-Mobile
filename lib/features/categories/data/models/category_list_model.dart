import 'package:rentpal/features/categories/domain/entities/categories_list.dart';

class CategoryListModel extends CategoryListEntity {
  @override
  final int? id;
  @override
  final String? categoryName;

  const CategoryListModel({
    this.id,
    this.categoryName,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        id: json["id"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
      };
}
