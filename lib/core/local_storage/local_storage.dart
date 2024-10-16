import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();
  factory LocalStorage() => _instance;

  static const _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = "token";

  static void setToken(Map<String,dynamic> jsonData) async {
    final String jsonString = jsonEncode(jsonData);
    await _secureStorage.write(key: _tokenKey, value: jsonString);
  }

  static Future<Map<String,dynamic>?> getToken() async {
    final String? jsonString = await _secureStorage.read(key: _tokenKey);
    if(jsonString!=null){
      return jsonDecode(jsonString);
    }
    return null;
  }

  static void deleteToken()async{
    await _secureStorage.delete(key: _tokenKey);
  }
}
