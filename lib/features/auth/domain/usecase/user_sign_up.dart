import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<Either<Failure, User>, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call({UserSignUpParams? params}) async {
    return await authRepository.signUpWithEmailPassword(
        name: params!.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
