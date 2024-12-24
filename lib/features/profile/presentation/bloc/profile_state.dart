import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';
import 'package:rentpal/features/profile/domain/entity/user_profile_entity.dart';

sealed class ProfileState {
  final ProfileEntity? profile;
  final UserProfileEntity? userProfile;
  final String? error;
  ProfileState({this.profile, this.error, this.userProfile});
}

class Profieinitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String err;
  ProfileError({required this.err}) : super(error: err);
}

class ProfileSuccess extends ProfileState {
  final ProfileEntity data;
  ProfileSuccess({required this.data}) : super(profile: data);
}

class UserProfileSuccess extends ProfileState {
  final UserProfileEntity data;
  UserProfileSuccess({required this.data}) : super(userProfile: data);
}

class ProfileUpdateSuccess extends ProfileState {}
