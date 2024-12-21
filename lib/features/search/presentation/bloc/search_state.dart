import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

sealed class SearchState {
  final String? error;
  final List<RentitemEntity>? listings;
  SearchState({this.error,this.listings});
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<RentitemEntity> data;
  SearchSuccess({required this.data}) : super(listings: data);
}

class SearchError extends SearchState {
  final String err;
  SearchError({required this.err}) : super(error: err);
}