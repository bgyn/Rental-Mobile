import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/categories/data/data_source/remote/category_api_service.dart';
import 'package:rentpal/features/categories/domain/entities/category_entity.dart';
import 'package:rentpal/features/categories/domain/repository/category_list_repository.dart';

class CategoryListRepositoryImpl implements CategoryListRepository {
  final CategoryApiService _categoryApiService;
  CategoryListRepositoryImpl(
    this._categoryApiService,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList() async {
    try {
      final response = await _categoryApiService.getCategoryList();
      final List jsonList = jsonDecode(response.body);
      final result = CategoryEntity.fromJsonList(jsonList);
      return right(result);
    } on SocketException {
      return left(const ServerFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
