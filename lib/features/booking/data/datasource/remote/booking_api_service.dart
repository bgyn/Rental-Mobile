import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class BookingApiService {
  Future<http.Response> bookRentItem(String rentItemId, DateTime startDate,
      DateTime endDate, int userId) async {
    final url = ApiRoutes.getcategories();
    final response = await http.post(Uri.parse(url), body: {
      'rentItemId': rentItemId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'userId': userId.toString()
    });
    return response;
  }
}
