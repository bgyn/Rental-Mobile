import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<Either<Failure, User>, void> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call({void params}) async {
    return await authRepository.currentUser();
  }
}
