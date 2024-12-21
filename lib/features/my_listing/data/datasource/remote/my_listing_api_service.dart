import 'package:rentpal/config/routes/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:rentpal/core/local_storage/local_storage.dart';

class MyListingApiService {
  Future<http.Response> getListings() async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.getListing();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Token ${token!['token']}",
    });
    print(response.body);
    return response;
  }
}
