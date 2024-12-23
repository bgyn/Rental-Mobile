import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

sealed class RecommendationState {
  final List<RentitemEntity>? rentItems;
  final String? errorMessage;
  const RecommendationState({this.rentItems, this.errorMessage});
}

class RecommendationInitial extends RecommendationState {
  const RecommendationInitial() : super(rentItems: null, errorMessage: null);
}

class RecommendationLoading extends RecommendationState {
  const RecommendationLoading() : super(rentItems: null, errorMessage: null);
}

class RecommendationLoaded extends RecommendationState {
  const RecommendationLoaded({required List<RentitemEntity> rentItems})
      : super(rentItems: rentItems, errorMessage: null);
}

class RecommendationError extends RecommendationState {
  const RecommendationError({required String errorMessage})
      : super(rentItems: null, errorMessage: errorMessage);
}
