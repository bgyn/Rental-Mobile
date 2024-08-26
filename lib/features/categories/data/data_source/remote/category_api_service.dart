import 'package:http/http.dart' as http;

class CategoryApiService {
  Future<http.Response> getCategoryList() async {
    final response = await http
        .get(Uri.parse('http://rentpal.bigyanthanait.com.np/api/categories'));
    return response;
  }
}
