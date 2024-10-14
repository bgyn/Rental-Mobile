import 'dart:io';

import 'package:rentpal/config/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class AddListingApiService {
  Future<http.Response> publishListing(body, File file) async {
    final url = ApiRoutes.publishListing();
    final request = http.MultipartRequest("POST", Uri.parse(url));
    final headers = <String,String>{
      "Content-Type": "application/json"
    };
    request.fields["title"] = body["title"];
    request.fields["price"] = "${body["price"]}";
    request.fields["description"] = body["description"];
    request.fields["quantity"] = "${body["quantity"]}";
    request.fields["rating"] = "${body["rating"]}";
    request.fields["noOfReviews"] = "${body["noOfReviews"]}";
    request.fields["address"] = body["address"];
    request.fields["latitude"] = "${body["latitude"]}";
    request.fields["longitude"] = "${body["longitude"]}";
    request.fields["itemRules"] = "${body["itemRules"]}";
    request.fields["category"] = "${body["category"]}";
    request.headers.addAll(headers);

     final multipartFile = await http.MultipartFile.fromPath(
      "file", 
      file.path,
    );
    request.files.add(multipartFile);
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    return res;
  }
}
