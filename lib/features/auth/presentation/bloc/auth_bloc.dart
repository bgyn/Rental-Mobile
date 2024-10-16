import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/features/auth/domain/entities/user_session_entity.dart';
import 'package:rentpal/features/auth/domain/usecase/is_loggedin.dart';
import 'package:rentpal/features/auth/domain/usecase/user_login.dart';
import 'package:rentpal/features/auth/domain/usecase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final IsLoggedIn _isLoggedIn;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required IsLoggedIn isLoggedIn,
  })  : _userLogin = userLogin,
        _userSignUp = userSignUp,
        _isLoggedIn = isLoggedIn,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<AuthLogout>(_onAuthLogout);
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _isLoggedIn();
    res.fold(
      (l) => emit(AuthFaliure(l.errorMessage)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(
      params: UserSignUpParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
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
      (l) => emit(AuthFaliure(l.errorMessage)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthLogout(AuthLogout event, Emitter<AuthState> emit)async {
    LocalStorage.deleteToken();
    emit(AuthLoggedOut());
  }

  void _emitAuthSuccess(
    UserSessionEntity session,
    Emitter<AuthState> emit,
  ) {
    LocalStorage.setToken(session.toJson());
    emit(AuthSuccess(session));
  }

  
}
