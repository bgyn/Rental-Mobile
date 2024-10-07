import 'package:rentpal/core/constant/url_constant.dart';

class ApiRoutes {
  static String getcategories() {
    // return "https://mocki.io/v1/274c0f41-5a7d-4243-966b-2c523366a357";
    return "${UrlConstant.baseUrl}categories/";
  }

  static String publishListing() {
    return "${UrlConstant.baseUrl}rentlist/";
  }
}
