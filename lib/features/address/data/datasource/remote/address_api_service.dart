import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:rentpal/config/routes/api_routes.dart";

class AddressApiService {
  Future<http.Response> getAddressList(String query) async {
    final apiKey = dotenv.get("LOCATIONIQAPIKEY");
    final url = ApiRoutes.getAddress(
        key: apiKey, query: query);
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
