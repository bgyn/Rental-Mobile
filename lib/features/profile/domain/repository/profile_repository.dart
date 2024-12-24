import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';
import 'package:rentpal/features/profile/domain/entity/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure,void>> updateProfile({
    File? file,
    required String? address,
    required String? phone,
    required String? dob,
    required String? gender,
    String? aboutYou,
  });
  Future<Either<Failure, ProfileEntity>> getProfile();

  Future<Either<Failure, UserProfileEntity>> getProfileById(int id);
}
