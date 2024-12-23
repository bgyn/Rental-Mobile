import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';

class RentalsApiService {
  Future<http.Response> getRentals() async {
    final url = ApiRoutes.rentals();
    final token = await LocalStorage.getToken();
    final response = await http.get(Uri.parse(url),
        headers: {"Authorization": "Token ${token!['token']}"});
    return response;
  }

  Future<http.Response> updateRentals(int id) async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.rentals();
    final response = await http.patch(Uri.parse(url),
        headers: {"Authorization": "Token ${token!['token']}"});
    return response;
  }
}
