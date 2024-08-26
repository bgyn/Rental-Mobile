import 'package:equatable/equatable.dart';

class CategoryListEntity extends Equatable {
  final int? id;
  final String? categoryName;
  const CategoryListEntity({
    this.id,
    this.categoryName,
  });

  @override
  List<Object?> get props => [id, categoryName];
}
