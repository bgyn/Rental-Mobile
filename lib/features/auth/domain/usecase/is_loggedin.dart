import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/auth/domain/entities/user_session_entity.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class IsLoggedIn implements UseCase<Either<Failure, UserSessionEntity>, void> {
  final AuthRepository authRepository;
  IsLoggedIn(this.authRepository);

  @override
  Future<Either<Failure, UserSessionEntity>> call({void params}) async {
    return await authRepository.isLoggedIn();
  }
}
