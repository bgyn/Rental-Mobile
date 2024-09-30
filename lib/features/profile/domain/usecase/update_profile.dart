import 'dart:io';

import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class UpdateProfile extends UseCase<void, UpdateProfileParams> {
  final ProfileRepository profileRepository;
  UpdateProfile(this.profileRepository);

  @override
  Future<void> call({UpdateProfileParams? params}) async {
    await profileRepository.updateProfile(
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
  String? aboutYou;

  UpdateProfileParams({
    this.file,
    required this.fname,
    required this.lname,
    required this.address,
    required this.aboutYou,
  });
}
