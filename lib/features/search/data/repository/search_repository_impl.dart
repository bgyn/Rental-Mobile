import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/search/data/datasource/remote/search_api_service.dart';
import 'package:rentpal/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchApiService _searchApiService;
  SearchRepositoryImpl(this._searchApiService);
  @override
  Future<Either<Failure, List<RentitemEntity>>> search(String query) async {
    try {
      final result = await _searchApiService.search(query);
      if (result.statusCode == 200) {
        final List jsonList = jsonDecode(result.body);
        final rentitemList = RentitemEntity.fromJsonList(jsonList);
        return right(rentitemList);
      }
      return left(const ServerFailure("Error fetching rentitem"));
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Error fetching renitem"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
