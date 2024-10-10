import "package:http/http.dart" as http;
import "package:rentpal/config/routes/api_routes.dart";

class AddressApiService {
  Future<http.Response> getAddressList(String query) async {
    final url = ApiRoutes.getAddress(
        key: "pk.ae890576768ef17ebba78b46d215d548", query: query);
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
