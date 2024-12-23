import 'package:rentpal/features/rentals/domain/entity/rentals_entity.dart';

sealed class RentalsState {
  final List<RentalsEntity>? rentals;
  final String? errMessage;

  RentalsState({this.rentals, this.errMessage});
}

class RentalsInitial extends RentalsState {}

class RentalsLoading extends RentalsState {}

class RentalsLoaded extends RentalsState {
  RentalsLoaded({required List<RentalsEntity> rentals})
      : super(rentals: rentals);
}

class RentalsError extends RentalsState {
  RentalsError({required String errMessage}) : super(errMessage: errMessage);
}
