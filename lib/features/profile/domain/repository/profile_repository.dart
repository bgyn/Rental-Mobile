import 'dart:io';

abstract class ProfileRepository {
  Future<void> updateProfile({
    File? file,
    required String? fname,
    required String? lname,
    required String? address,
    String? aboutYou,
  });
}
