part of "app_user_cubit.dart";

@immutable
sealed class AppUserState {}

final class AppUserInital extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final User user;
  AppUserLoggedIn(this.user);
}
