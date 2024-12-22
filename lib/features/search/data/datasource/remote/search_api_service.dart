import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class SearchApiService {
  Future<http.Response> search(String query) async {
    final url = ApiRoutes.search(query);
    final response = await http.get(Uri.parse(url));
    print("search result ${response.body}");
    return response;
  }
}
