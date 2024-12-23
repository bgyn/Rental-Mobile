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

  static String signUpUser() {
    return "${UrlConstant.authUrl}register/";
  }

  static String loginUser() {
    return "${UrlConstant.authUrl}login/";
  }

  static String getUser() {
    return "${UrlConstant.baseUrl}user/";
  }

  static String getProfile() {
    return "${UrlConstant.authUrl}profile/";
  }

  static String getListing() {
    return "${UrlConstant.baseUrl}my_listing/";
  }

  static String search(String query) {
    return "${UrlConstant.baseUrl}rentlist?search=$query";
  }

  static String book() {
    return "${UrlConstant.baseUrl}booking/";
  }

  static String booking() {
    return "${UrlConstant.baseUrl}my_booking/";
  }

  static String recommendation() {
    return "${UrlConstant.baseUrl}recommended/";
  }

  static String rentals() {
    return "${UrlConstant.baseUrl}rentals";
  }
}
