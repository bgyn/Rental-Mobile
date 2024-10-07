import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStates {
  bool? isLoggedIn;
  bool? isloading;
  bool? isLogginIn;
  AuthStates(
      {this.isLoggedIn = false,
      this.isloading = false,
      this.isLogginIn = false});

  AuthStates copyWith({bool? isLoggedIn, bool? isloading, bool? isLogginIn}) {
    return AuthStates(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isloading: isloading ?? this.isloading,
        isLogginIn: isLogginIn ?? this.isLogginIn);
  }
}

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthStates());

  void login() async {
    emit(state.copyWith(isLogginIn: true));
    await Future.delayed(
      const Duration(seconds: 3),
      () => {
        emit(state.copyWith(
            isLoggedIn: true, isloading: false, isLogginIn: false))
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
