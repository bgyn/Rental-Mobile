import 'package:rentpal/config/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class MyListingApiService {
  Future<http.Response> getListings() async {
    final url = ApiRoutes.getListing();
    final response = await http.get(Uri.parse(url),);
    return response;
  }
}