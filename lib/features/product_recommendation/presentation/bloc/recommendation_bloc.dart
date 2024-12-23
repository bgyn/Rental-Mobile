import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/product_recommendation/domain/usecase/get_recommendation.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendatino_event.dart';
import 'package:rentpal/features/product_recommendation/presentation/bloc/recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendatinoEvent, RecommendationState> {
  final GetRecommendation _getRecommendation;
  RecommendationBloc(this._getRecommendation)
      : super(const RecommendationInitial()){
        on<FetchRecommendation>(_onFetchRecommendation);
      }

  void _onFetchRecommendation(
      FetchRecommendation event, Emitter<RecommendationState> emit) async {
    emit(const RecommendationLoading());
    final result = await _getRecommendation.call();
    result.fold(
      (l) => emit(RecommendationError(errorMessage: l.errorMessage)),
      (r) => emit(RecommendationLoaded(rentItems: r)),
    );
  }
}
