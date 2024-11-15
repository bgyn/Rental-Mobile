// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rentpal/features/user/domain/usecase/get_user_usecase.dart';
import 'package:rentpal/features/user/presentation/bloc/user_event.dart';
import 'package:rentpal/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser _getUser;
  UserBloc(
    this._getUser,
  ) : super(UserLoading()) {
    on<FetchUser>(_onFetchUser);
  }

  void _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
    final data = await _getUser.call();
    data.fold((l) => UserError(err: l.errorMessage),
        (r) => emit(UserSuccess(data: r)));
  }
}
