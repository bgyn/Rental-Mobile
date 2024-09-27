import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<Either<Failure, User>, UserLoginParams> {
  final AuthRepository authRepository;

  UserLogin({required this.authRepository});

  @override
  Future<Either<Failure, User>> call({UserLoginParams? params}) async {
    return await authRepository.logInWithEmailPassword(
        email: params!.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
