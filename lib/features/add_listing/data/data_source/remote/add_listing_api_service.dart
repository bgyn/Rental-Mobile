import 'dart:convert';

import 'package:rentpal/config/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class AddListingApiService {
  Future<http.Response> publishListing(body) async {
    final url = ApiRoutes.publishListing();
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }
}
