import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class RentitemApiService {
  Future<http.Response> getRentItem() async {
    final url = ApiRoutes.getRentItem();
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return response;
  }
}
