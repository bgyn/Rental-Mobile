import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class UpdateProfile extends UseCase<void, UpdateProfileParams> {
  final ProfileRepository profileRepository;
  UpdateProfile(this.profileRepository);

  @override
  Future<Either<Failure,void>> call({UpdateProfileParams? params}) async {
   return await profileRepository.updateProfile(
      file: params?.file,
      fname: params?.fname,
      lname: params?.lname,
      address: params?.lname,
      aboutYou: params?.aboutYou,
    );
  }
}

class UpdateProfileParams {
  File? file;
  final String fname;
  final String lname;
  final String address;
  final String phone;
  String? aboutYou;

  UpdateProfileParams({
    this.file,
    required this.fname,
    required this.phone,
    required this.lname,
    required this.address,
    required this.aboutYou,
  });
}
