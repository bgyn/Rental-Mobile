import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';

abstract class RentitemState {
  final List<RentitemEntity>? rentitem;

  RentitemState({this.rentitem});
}

class RentItemLoading extends RentitemState {}

class RentItemSuccess extends RentitemState {
  final List<RentitemEntity> data;
  RentItemSuccess({
    required this.data,
  }) : super(rentitem: data);
}
