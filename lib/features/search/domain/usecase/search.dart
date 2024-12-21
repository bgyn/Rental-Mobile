import 'package:fpdart/fpdart.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/core/usecases/usecases.dart';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:rentpal/features/search/domain/repository/search_repository.dart';

class Search extends UseCase<Either<Failure,List<RentitemEntity>>,String>{
  
  final SearchRepository searchRepository;
  Search(this.searchRepository);

  @override
  Future<Either<Failure, List<RentitemEntity>>> call({String? params}) async {
    return await searchRepository.search(params!);
  }
}