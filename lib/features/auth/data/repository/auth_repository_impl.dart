import 'dart:convert';

import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/common/entities/user.dart';
import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;
  AuthRepositoryImpl(
    this._authApiService,
  );
  @override
  Future<Either<Failure, User>> currentUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> logInWithEmailPassword(
      {required String email, required String password}) async{
    try{
      final response = await _authApiService.login(email, password);
      if(response.statusCode == 200){
        return right(User(id: "2343", email: email, name: "demo"));
      }else if(response.statusCode == 400){
        return left(const ServerFailure("Username or password is incorrect"));
      }
      else{
        return left(const ServerFailure("Please try again!"));
      }
    }catch(e){
      return left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String confirmPassword,
      required String email,
      required String password}) async {
    try {
      final response = await _authApiService.signUp(
        email,
        firstName,
        lastName,
        password,
        confirmPassword,
      );

      if (response.statusCode == 200) {
        return right(User(
          id: "234253",
          email: jsonDecode(response.body)["email"],
          name:
              "${jsonDecode(response.body)["firstName"]} ${jsonDecode(response.body)["lastname"]}}",
        ));
      } else if(response.statusCode == 400) {
        return left(const ServerFailure("Email is already taken"));
      }else{
        return left(const ServerFailure("Please try again!"));
      }
    } catch (e) {
      return left(ServerFailure("$e"));
    }
  }
}
