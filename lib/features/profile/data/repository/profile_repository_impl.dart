import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/features/profile/data/source/remotesource/profile_api_service.dart';
import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService _profileApiService;

  ProfileRepositoryImpl(this._profileApiService);
  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await _profileApiService.getProfile();
      if (response.statusCode == 200) {
        final profile = ProfileEntity.fromJson(jsonDecode(response.body));
        LocalStorage.setProfile();
        return right(profile);
      }
      return left(const ConnectionFailure("Failed to get profile"));
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
      required String? gender,
      required String? dob,
      required String? address,
      required String? phone,
      String? aboutYou}) async {
    try {
      final response = await _profileApiService.updateProfile(
        file: file,
        dob: dob!,
        gender: gender!,
        phone: phone!,
        aboutYou: aboutYou,
        address: address!,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(null);
      }
      return left(const ConnectionFailure("Failed to update profile"));
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
