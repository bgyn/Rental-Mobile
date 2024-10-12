import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();
  factory LocalStorage() => _instance;

  static const _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = "token";

  static void setToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }
}
