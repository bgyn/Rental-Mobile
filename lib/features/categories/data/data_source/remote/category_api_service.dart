import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class CategoryApiService {
  Future<http.Response> getCategoryList() async {
    final url = ApiRoutes.getcategories();
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
