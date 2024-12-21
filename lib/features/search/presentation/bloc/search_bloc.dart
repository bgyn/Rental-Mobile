import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/search/domain/usecase/search.dart';
import 'package:rentpal/features/search/presentation/bloc/search_event.dart';
import 'package:rentpal/features/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Search search;
  SearchBloc(this.search) : super(SearchInitial()) {
    on<SearchItem>(_onSearch);
    on<SearchClear>(_onclearSearch);
  }

  void _onSearch(SearchItem event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final data = await search.call(params: event.query);
    data.fold(
      (l) => emit(SearchError(err: l.errorMessage)),
      (r) => emit(
        SearchSuccess(data: r),
      ),
    );
  }

  void _onclearSearch(SearchClear event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}
