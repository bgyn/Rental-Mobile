import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/profile/domain/usecase/get_profile.dart';
import 'package:rentpal/features/profile/domain/usecase/get_profile_by_id.dart';
import 'package:rentpal/features/profile/domain/usecase/update_profile.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;
  final GetProfileById _getProfileById;
  ProfileBloc({
    required GetProfile getProfile,
    required UpdateProfile updateProfile,
    required GetProfileById getProfileById,
  })  : _getProfile = getProfile,
        _updateProfile = updateProfile,
        _getProfileById = getProfileById,
        super(Profieinitial()) {
    on<ProfileFetch>(_onProfileFetch);
    on<ProfileUpdate>(_onProfileUpdate);
    on<UserProfileFetch>(_onUserProfileFetch);
  }

  void _onProfileUpdate(ProfileUpdate event, Emitter<ProfileState> emit) async {
    final data = await _updateProfile.call(
        params: UpdateProfileParams(
      file: event.file,
      phone: event.phone,
      address: event.address,
      gender: event.gender,
      dob: event.dob,
      aboutYou: event.aboutYou,
    ));
    data.fold((l) => emit(ProfileError(err: l.errorMessage)),
        (r) => emit(ProfileUpdateSuccess()));
  }

  void _onProfileFetch(ProfileFetch event, Emitter<ProfileState> emit) async {
    final data = await _getProfile.call();
    data.fold((l) => emit(ProfileError(err: l.errorMessage)),
        (r) => emit(ProfileSuccess(data: r)));
  }

  void _onUserProfileFetch(
      UserProfileFetch event, Emitter<ProfileState> emit) async {
    final data = await _getProfileById.call(params: event.id);
    data.fold((l) => emit(ProfileError(err: l.errorMessage)),
        (r) => emit(UserProfileSuccess(data: r)));
  }
}
