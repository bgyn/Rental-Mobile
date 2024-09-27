import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/core/common/entities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState>{
  AppUserCubit() : super(AppUserInital());

  void updateUser(User? user){
    if(user==null){
      emit(AppUserInital());
    }else{
      emit(AppUserLoggedIn(user));
    }
  }
}
