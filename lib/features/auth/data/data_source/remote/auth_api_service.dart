import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class AuthApiService {
  Future<http.Response> signUp(
    String email,
    String firstName,
    String lastName,
    String password,
    String confirmPassword,
  ) async {
    final url = ApiRoutes.signUpUser();
    final respose = await http.post(Uri.parse(url),body: {
      "email" : email,
      "first_name" : firstName,
      "last_name" : lastName,
      "password" : password,
      "confirm_password" : confirmPassword,
    });
  
    return respose;
  }
  Future<http.Response> login(String username,String password)async{
    final url = ApiRoutes.loginUser();
    final response = await http.post(Uri.parse(url),body: {
      "username" : username,
      "password" : password,
    });
    return response;
  }

}
