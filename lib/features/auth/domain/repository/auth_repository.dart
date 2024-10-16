import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/auth/domain/entities/user_session_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserSessionEntity>> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String confirmPassword,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserSessionEntity>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserSessionEntity>> isLoggedIn();
}
