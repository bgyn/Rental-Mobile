import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class UpdateProfile extends UseCase<void, UpdateProfileParams> {
  final ProfileRepository profileRepository;
  UpdateProfile(this.profileRepository);

  @override
  Future<Either<Failure, void>> call({UpdateProfileParams? params}) async {
    return await profileRepository.updateProfile(
      file: params?.file,
      address: params?.address,
      aboutYou: params?.aboutYou,
      phone: params?.phone,
      dob: params?.dob,
      gender: params?.gender,
    );
  }
}

class UpdateProfileParams {
  File? file;
  final String address;
  final String phone;
  final String gender;
  final String dob;
  String? aboutYou;

  UpdateProfileParams({
    this.file,
    required this.phone,
    required this.address,
    required this.aboutYou,
    required this.dob,
    required this.gender,
  });
}
