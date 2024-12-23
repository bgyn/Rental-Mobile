import 'dart:io';

import 'package:rentpal/config/routes/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:rentpal/core/local_storage/local_storage.dart';

class AddListingApiService {
  Future<http.Response> publishListing(body, File file) async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.publishListing();
    final request = http.MultipartRequest("POST", Uri.parse(url));
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Token ${token!['token']}"
    };
    request.fields["title"] = body["title"];
    request.fields["price"] = "${body["price"]}";
    request.fields["description"] = body["description"];
    request.fields["inStock"] = "${body["quantity"]}";
    request.fields["rating"] = "${body["rating"]}";
    request.fields["noOfReviews"] = "${body["noOfReviews"]}";
    request.fields["address"] = body["address"];
    request.fields["latitude"] = "${body["latitude"]}";
    request.fields["longitude"] = "${body["longitude"]}";
    request.fields["itemRules"] = "${body["itemRules"]}";
    request.fields["category"] = "${body["category"]}";
    request.headers.addAll(headers);

    final multipartFile = await http.MultipartFile.fromPath(
      "thumbnailImage",
      file.path,
    );

    request.files.add(multipartFile);
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    return res;
  }

  Future<http.Response> updateListing(body, File? file, int id) async {
    final token = await LocalStorage.getToken();
    final url = ApiRoutes.updateListing(id);
    final request = http.MultipartRequest("PATCH", Uri.parse(url));
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Token ${token!['token']}"
    };

    request.fields["title"] = body["title"];
    request.fields["price"] = "${body["price"]}";
    request.fields["description"] = body["description"];
    request.fields["inStock"] = "${body["quantity"]}";
    request.fields["rating"] = "${body["rating"]}";
    request.fields["noOfReviews"] = "${body["noOfReviews"]}";
    request.fields["address"] = body["address"];
    request.fields["latitude"] = "${body["latitude"]}";
    request.fields["longitude"] = "${body["longitude"]}";
    request.fields["rules"] = "${body["itemRules"]}";
    request.fields["category"] = "${body["category"]}";
    request.headers.addAll(headers);

    print(body["category"]);

    if (file != null) {
      final multipartFile = await http.MultipartFile.fromPath(
        "thumbnailImage",
        file.path,
      );
      request.files.add(multipartFile);
    }
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    print(res.body);
    return res;
  }
}
