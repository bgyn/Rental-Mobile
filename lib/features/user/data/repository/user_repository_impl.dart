// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/user/data/datasource/user_api_service.dart';
import 'package:rentpal/features/user/domain/entity/user_entity.dart';
import 'package:rentpal/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService userApiService;
  UserRepositoryImpl(
    this.userApiService,
  );
  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final response = await userApiService.getUser();
      final result = UserEntity.fromJson(jsonDecode(response.body));
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
