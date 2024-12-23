part of "auth_bloc.dart";

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserSessionEntity session;
  const AuthSuccess(this.session);
}

final class RegisterSuccess extends AuthState{
  final UserSessionEntity session;  
  const RegisterSuccess(this.session);
}

final class AuthFaliure extends AuthState {
  final String message;
  const AuthFaliure(this.message);
}

final class AuthLoggedOut extends AuthState{}
