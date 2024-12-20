import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/profile/domain/entity/profile_entity.dart';
import 'package:rentpal/features/profile/domain/repository/profile_repository.dart';

class GetProfile extends UseCase<Either<Failure, ProfileEntity>, void> {
  final ProfileRepository _profileRepository;
  GetProfile(this._profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call({void params}) {
    return _profileRepository.getProfile();
  }
}
