import 'package:rentpal/core/local_storage/local_storage.dart';

class LocalAuthApiService {
  Future<Map<String, dynamic>?> isUserLoggedIn() async {
    final response = await LocalStorage.getToken();
    return response;
  }
}
