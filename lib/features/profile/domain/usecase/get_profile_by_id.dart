import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/profile/domain/entity/user_profile_entity.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class GetProfileById extends UseCase<Either<Failure, UserProfileEntity>, int> {
  final ProfileRepository _repository;

  GetProfileById({required ProfileRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, UserProfileEntity>> call({int? params}) async {
    return await _repository.getProfileById(params!);
  }
}
