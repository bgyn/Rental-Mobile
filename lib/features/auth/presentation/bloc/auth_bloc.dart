import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rentpal/core/common/cubit/app_user_cubit.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/features/auth/domain/usecase/current_user.dart';
import 'package:rentpal/features/auth/domain/usecase/user_login.dart';
import 'package:rentpal/features/auth/domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  // final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    // required AppUserCubit appUserCubit,
  })  : _userLogin = userLogin,
        _userSignUp = userSignUp,
        _currentUser = currentUser,
        // _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser();
    res.fold(
      (l) => emit(AuthFaliure(l.errorMessage)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(
      params: UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    res.fold(
      (l) => emit(AuthFaliure(l.errorMessage)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(
      params: UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (l) => AuthFaliure(l.errorMessage),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    // _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
