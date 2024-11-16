import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class ProfileApiService {
  Future<http.Response> getProfile(int id)async{
    final url = ApiRoutes.getProfile();
    final response = await http.get(Uri.parse(url));
    return response;
  }
  Future<http.Response> updateProfile()async{
    final url = ApiRoutes.getProfile();
    final response = await http.get(Uri.parse(url));
    return response;
  }
}