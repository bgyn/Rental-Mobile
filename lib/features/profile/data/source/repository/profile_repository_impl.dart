import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/profile/data/source/remotesource/profile_api_service.dart';
import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService profileApiService;

  ProfileRepositoryImpl(this.profileApiService);
  @override
  Future<Either<Failure, ProfileEntity>> getProfile(int id) async {
    try {
      final response = await profileApiService.getProfile(id);
      final profile = ProfileEntity.fromJson(jsonDecode(response.body));
      return right(profile);
    } on SocketException {
      return left(const ConnectionFailure("No internet connection"));
    } on HttpException {
      return left(const ServerFailure("Couldn't find the resource"));
    } on FormatException {
      return left(const ServerFailure("Bad response format"));
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      {File? file,
      required String? fname,
      required String? lname,
      required String? address,
      String? aboutYou}) async {
    try {
      final response = await profileApiService.updateProfile();
      if (response.statusCode == 200) {
        return right(null);
      }
      return left(const ConnectionFailure("Failed to fetch profile"));
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
