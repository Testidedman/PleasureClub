import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> setToken(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> setStories(Map<String, dynamic> json);
  Future<Map<String, dynamic>> getStories();
}

class IStorageService extends StorageService {
  @override
  Future<void> setToken(String accessToken, String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
    prefs.setString('refresh_token', refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('refresh_token');
    return token;
  }

  @override
  Future<void> setStories(Map<String, dynamic> json) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stories', jsonEncode(json));
  }

  @override
  Future<Map<String, dynamic>> getStories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final stories = prefs.getString('stories');
    return stories == null ? {'items': []} : jsonDecode(stories);
  }
}