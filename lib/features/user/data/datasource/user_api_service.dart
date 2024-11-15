import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class UserApiService {
  Future<http.Response> getUser() async {
    final url = ApiRoutes.getUser();
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
