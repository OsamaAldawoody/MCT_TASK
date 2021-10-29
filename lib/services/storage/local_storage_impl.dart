import 'package:shared_preferences/shared_preferences.dart';

import '_local_storage.dart';

class LocaleStorageImpl implements LocalStorage {
  static const tokenKey = 'token';
  late SharedPreferences prefs;

  LocaleStorageImpl() {
    setUp();
  }

  void setUp() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  String getToken() {
    return prefs.getString(tokenKey) ?? 'unautharized (no token)';
  }

  @override
  void saveToken(String token) {
    prefs.setString(tokenKey, token);
  }
}
