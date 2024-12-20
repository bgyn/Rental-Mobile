import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';

sealed class ProfileState {
  final ProfileEntity? profile;
  final String? error;
  ProfileState({this.profile, this.error});
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String err;
  ProfileError({required this.err}) : super(error: err);
}

class ProfileSuccess extends ProfileState {
  final ProfileEntity data;
  ProfileSuccess({required this.data}) : super(profile: data);
}

class ProfileUpdateSuccess extends ProfileState {}
