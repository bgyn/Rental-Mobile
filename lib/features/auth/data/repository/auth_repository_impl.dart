import 'dart:convert';

import 'package:fpdart/fpdart.dart';

import 'package:rentpal/core/error/faliure.dart';
import 'package:rentpal/features/auth/data/data_source/local/local_auth_api_service.dart';
import 'package:rentpal/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:rentpal/features/auth/domain/entities/user_session_entity.dart';
import 'package:rentpal/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;
  final LocalAuthApiService _localAuthApiService;
  AuthRepositoryImpl(
    this._authApiService,
    this._localAuthApiService,
  );
  @override
  Future<Either<Failure, UserSessionEntity>> isLoggedIn() async{
    final response = await _localAuthApiService.isUserLoggedIn();
    if(response!=null){
      final data = UserSessionEntity.fromJson(response);
      if(data.token?.isEmpty ?? true){
        return left(const TokenFailure("Token Expired"));
      }else{
        return right(
         data
        );
      }
    }else{
      return left(const TokenFailure("Token Expired"));
    }
  }

  @override
  Future<Either<Failure, UserSessionEntity>> logInWithEmailPassword(
      {required String email, required String password}) async{
    try{
      final response = await _authApiService.login(email, password);
      final data = UserSessionEntity.fromJson(jsonDecode(response.body));
      if(response.statusCode == 200){
        return right(data);
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
  Future<Either<Failure, UserSessionEntity>> signUpWithEmailPassword(
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
        final data = UserSessionEntity.fromJson(jsonDecode(response.body));
        return right(data);
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
