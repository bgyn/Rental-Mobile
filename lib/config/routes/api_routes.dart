import 'package:rentpal/core/constant/url_constant.dart';

class ApiRoutes {
  static String getcategories() {
    return "${UrlConstant.baseUrl}categories/";
  }

  static String publishListing() {
    return "${UrlConstant.baseUrl}rentlist/";
  }

  static String getRentItem() {
    return "${UrlConstant.baseUrl}rentlist/";
  }

  static String getAddress({required String key, required String query}) {
    return "${UrlConstant.locationUrl}key=$key&countrycodes=np&q=$query&format=json";
  }

  static String signUpUser(){
    return "${UrlConstant.authUrl}register/";
  }
  
  static String loginUser(){
    return "${UrlConstant.authUrl}login/";
  }
}
