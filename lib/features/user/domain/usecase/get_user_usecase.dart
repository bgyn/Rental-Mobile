// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/user/domain/entity/user_entity.dart';
import 'package:rentpal/features/user/domain/repository/user_repository.dart';

class GetUser implements UseCase<Either<Failure, UserEntity>, void> {
  final UserRepository _userRepository;
  GetUser(
    this._userRepository,
  );

  @override
  Future<Either<Failure, UserEntity>> call({void params}) async {
    return await _userRepository.getUser();
  }
}
