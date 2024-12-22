import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';

class BookingApiService {
  Future<http.Response> bookRentItem(
      int rentItemId, String startDate, String endDate, int userId) async {
    final url = ApiRoutes.booking();
    final token = await LocalStorage.getToken();

    final response = await http.post(Uri.parse(url), body: {
      'rent_item': rentItemId.toString(),
      'start_date': startDate,
      'end_date': endDate,
    }, headers: {
      "Authorization": "Token ${token!['token']}"
    });
    print(response.body);
    return response;
  }
}
