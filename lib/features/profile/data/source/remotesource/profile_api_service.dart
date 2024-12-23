import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rentpal/config/routes/api_routes.dart';
import 'package:rentpal/core/local_storage/local_storage.dart';
import 'package:rentpal/core/permission/permission_handler.dart';

class ProfileApiService {
  Future<http.Response> getProfile() async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.getProfile();
    final response = await http.get(Uri.parse(url),
        headers: {"Authorization": "Token ${token!['token']}"});
    return response;
  }

  Future<http.Response> getProfileById(int id) async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.getProfileById(id);
    final response = await http.get(Uri.parse(url),
        headers: {"Authorization": "Token ${token!['token']}"});
    return response;
  }

  Future<http.Response> updateProfile(
      {File? file,
      required String phone,
      required String dob,
      required String gender,
      required String address,
      String? aboutYou}) async {
    final location = await PermissionHandler().getCurrentLocation();
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.getProfile();
    final request = http.MultipartRequest("POST", Uri.parse(url));
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Token ${token!['token']}",
    };
    request.headers.addAll(headers);
    if (file != null) {
      final multiPartFile = await http.MultipartFile.fromPath(
        "profile_pic",
        file.path,
      );
      request.files.add(multiPartFile);
    }
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    request.fields['date_of_birth'] = dob;
    request.fields['gender'] = gender;
    if (location.latitude != null && location.longitude != null) {
      request.fields['latitude'] = location.latitude.toString();
      request.fields['longitude'] = location.longitude.toString();
    }
    if (aboutYou != null) {
      request.fields['about_you'] = aboutYou;
    }
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    return res;
  }
}
