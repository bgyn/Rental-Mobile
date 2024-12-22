import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';

class MyOrderApiService {
  Future<http.Response> getOrders() async {
    final url = ApiRoutes.booking();
    final token = await LocalStorage.getToken();
    final response = http.get(Uri.parse(url),
        headers: {"Authorization": "Token ${token!['token']}"});
    return response;
  }
}
