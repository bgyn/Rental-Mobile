import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';

class ProfileApiService {
  Future<http.Response> getProfile(int id) async {
    final url = ApiRoutes.getProfile();
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> updateProfile(
      {File? file,
      required String fName,
      required String lName,
      required String phone,
      required String address,
      String? aboutYou}) async {
    final url = ApiRoutes.getProfile();
    final request = http.MultipartRequest("POST", Uri.parse(url));
    final headers = <String, String>{"Content-Type": "application/json"};
    request.headers.addAll(headers);
    if (file != null) {
      final multiPartFile = await http.MultipartFile.fromPath(
        "file",
        file.path,
      );
      request.files.add(multiPartFile);
    }
    request.fields['fName'] = fName;
    request.fields['lName'] = lName;
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    if (aboutYou != null) {
      request.fields['aboutYou'] = aboutYou;
    }
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    return res;
  }
}
