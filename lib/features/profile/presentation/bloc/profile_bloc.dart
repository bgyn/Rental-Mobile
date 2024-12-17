import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/profile/domain/usecase/get_profile.dart';
import 'package:rentpal/features/profile/domain/usecase/update_profile.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_event.dart';
import 'package:rentpal/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;
  ProfileBloc({
    required GetProfile getProfile,
    required UpdateProfile updateProfile,
  })  : _getProfile = getProfile,
        _updateProfile = updateProfile,
        super(ProfieLoading()) {
    on<ProfileFetch>(_onProfileFetch);
    on<ProfileUpdate>(_onProfileUpdate);
  }

  void _onProfileUpdate(ProfileUpdate event, Emitter<ProfileState> emit) async {
    final data = await _updateProfile.call(
        params: UpdateProfileParams(
      file: event.file,
      fname: event.fname,
      lname: event.lname,
      phone: event.phone,
      address: event.address,
      aboutYou: event.aboutYou,
    ));
    data.fold((l) => ProfileError(err: l.errorMessage),
        (r) => ProfileUpdateSuccess());
  }

  void _onProfileFetch(ProfileFetch event, Emitter<ProfileState> emit) async {
    final data = await _getProfile.call(params: event.id);
    data.fold((l) => ProfileError(err: l.errorMessage),
        (r) => ProfileSuccess(data: r));
  }
}
