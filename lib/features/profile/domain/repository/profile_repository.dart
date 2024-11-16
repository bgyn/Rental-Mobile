import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure,void>> updateProfile({
    File? file,
    required String? fname,
    required String? lname,
    required String? address,
    String? aboutYou,
  });
  Future<Either<Failure, ProfileEntity>> getProfile(int id);
}
