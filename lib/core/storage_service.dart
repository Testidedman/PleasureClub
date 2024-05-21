import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> setToken(String accessToken, String refreshToken);
  Future<String?> getToken();
}

class IStorageService extends StorageService {
  @override
  Future<void> setToken(String accessToken, String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
    prefs.setString('refresh_token', refreshToken);
  }

  @override
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');
    return token;
  }
}