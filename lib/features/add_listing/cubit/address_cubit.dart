import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<bool> {
  AddressCubit() : super(false);

  toggle() {
    emit(!state);
  }
}
