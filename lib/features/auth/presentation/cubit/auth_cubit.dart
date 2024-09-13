import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  bool? isLoggedIn;
  bool? isloading;
  AuthState({this.isLoggedIn = false, this.isloading = false});

  get state => null;

  AuthState copyWith({bool? isLoggedIn, bool? isloading}) {
    return AuthState(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isloading: isloading ?? this.isloading);
  }
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void login() async {
    emit(state.copyWith(isloading: true));
    await Future.delayed(
      const Duration(seconds: 3),
      () => {
        emit(state.copyWith(
          isLoggedIn: true,
          isloading: false,
        ))
      },
    );
  }

  void logout() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => emit(
        state.copyWith(isLoggedIn: false),
      ),
    );
  }
}
