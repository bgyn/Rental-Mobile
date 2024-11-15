import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/user/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure,UserEntity>> getUser();
}