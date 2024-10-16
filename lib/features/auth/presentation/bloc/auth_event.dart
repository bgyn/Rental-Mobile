part of "auth_bloc.dart";

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;

  AuthSignUp({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required this.password,
  });
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthIsUserLoggedIn extends AuthEvent {}

final class AuthLogout extends AuthEvent{}
