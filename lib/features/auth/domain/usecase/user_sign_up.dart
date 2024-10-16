import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/auth/domain/entities/user_session_entity.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<Either<Failure, UserSessionEntity>, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, UserSessionEntity>> call({UserSignUpParams? params}) async {
    return await authRepository.signUpWithEmailPassword(
      firstName: params!.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}

class UserSignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  UserSignUpParams(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword});
}
