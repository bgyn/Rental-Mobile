// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rentpal/features/user/domain/entity/user_entity.dart';

abstract class UserState {
  final UserEntity? user;
  final String? error;
  UserState({
    this.user,
    this.error,
  });
}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String err;
  UserError({required this.err}) : super(error: err);
}

class UserSuccess extends UserState {
  final UserEntity data;
  UserSuccess({
    required this.data,
  }) : super(user: data);
}
