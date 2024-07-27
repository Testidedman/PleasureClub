import 'dart:convert';
import 'dart:developer';

import 'package:f/core/models/error_model.dart';
import 'package:f/core/storage_service.dart';
import 'package:http/http.dart' as http;

import 'constants/app_constants.dart';

abstract class NetworkClient {
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body);
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> delete(String url);
  Future<Map<String, dynamic>> patch(String url, Map<String, dynamic> body);
  Future<void> refresh();
}

class INetworkClient extends NetworkClient {

  final StorageService _storageService = IStorageService();

  @override
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    try {
      logRequest('post', url);
      final accessToken = await _storageService.getAccessToken();
      http.Response response = await http.post(
        Uri.parse('$baseUrl$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(body),
      );
      logResponse(response.statusCode, response.body, 'post', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
          await refresh();
          logRequest('post', url);
          final accessToken = await _storageService.getAccessToken();
          http.Response response = await http.post(
            Uri.parse('$baseUrl$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken'
            },
            body: jsonEncode(body),
          );
          logResponse(response.statusCode, response.body, 'post', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          return {
            'success': false,
            'status_code': response.statusCode
          };
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      logRequest('get', url);
      final accessToken = await _storageService.getAccessToken();
      http.Response response = await http.get(
        Uri.parse('$baseUrl$url'),
        //https://pc-backend-cqbr.onrender.com/
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
      );
      logResponse(response.statusCode, response.body, 'get', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
          await refresh();
          logRequest('get', url);
          final accessToken = await _storageService.getAccessToken();
          response = await http.get(
            Uri.parse('$baseUrl$url'),
            //https://pc-backend-cqbr.onrender.com/
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken'
            },
          );
          logResponse(response.statusCode, response.body, 'get', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          throw ErrorModel(
              statusCode: response.statusCode,
              message: response.body
          );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> delete(String url) async {
    try {
      logRequest('delete', url);
      final accessToken = await _storageService.getAccessToken();
      http.Response response = await http.delete(
        Uri.parse('$baseUrl$url'),
        //https://pc-backend-cqbr.onrender.com/
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
      );
      logResponse(response.statusCode, response.body, 'delete', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
          await refresh();
          logRequest('delete', url);
          final accessToken = await _storageService.getAccessToken();
          response = await http.delete(
            Uri.parse('$baseUrl$url'),
            //https://pc-backend-cqbr.onrender.com/
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken'
            },
          );
          logResponse(response.statusCode, response.body, 'delete', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          throw ErrorModel(
              statusCode: response.statusCode,
              message: response.body
          );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> patch(String url, Map<String, dynamic> body) async {
    try {
      logRequest('patch', url);
      final accessToken = await _storageService.getAccessToken();
      http.Response response = await http.patch(
        Uri.parse('$baseUrl$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      logResponse(response.statusCode, response.body, 'patch', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
          await refresh();
          logRequest('patch', url);
          response = await http.patch(
            Uri.parse('$baseUrl$url'),
            //https://pc-backend-cqbr.onrender.com/
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken'
            },
          );
          logResponse(response.statusCode, response.body, 'patch', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          throw ErrorModel(
              statusCode: response.statusCode,
              message: response.body
          );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> refresh() async {
    try {
      logRequest('post', 'refresh');
      final refreshToken = await _storageService.getRefreshToken();
      http.Response response = await http.post(
        Uri.parse('${baseUrl}refresh'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $refreshToken'
        },
      );
      logResponse(response.statusCode, response.body, 'post', 'refresh');
      if (response.statusCode == 200) {
        await _storageService.setToken(
          jsonDecode(response.body)['payload']['access_token'],
          jsonDecode(response.body)['payload']['refresh_token'],
        );
      } else {
        throw ErrorModel(
            statusCode: response.statusCode,
            message: response.body
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  void logRequest(String type, String url) {
    log('');
    log('----------------');
    log('Request:$baseUrl$url');
    log('type: $type');
    log('----------------');
    log('');
  }

  void logResponse(
      int statusCode,
      String body,
      String type,
      String url
      ) {
    log('----------------');
    log('type: $type');
    log('Request:$baseUrl$url');
    log('status: $statusCode');
    log('body: $body');
    log('----------------');
  }
}