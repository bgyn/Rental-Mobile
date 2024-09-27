import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';

abstract interface class AuthRepository {
  
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure,User>> currentUser();
}
