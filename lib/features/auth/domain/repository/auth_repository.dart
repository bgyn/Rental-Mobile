import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String confirmPassword,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
