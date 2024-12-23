import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';

class ProductRecommendationApiService {
  Future<http.Response> getRecommendation() async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.recommendation();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Token ${token!['token']}",
    });
    return response;
  }
}
