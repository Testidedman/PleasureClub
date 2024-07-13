import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class NetworkClient {
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body);
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> delete(String url);
  Future<Map<String, dynamic>> patch(String url, Map<String, dynamic> body);
}

class INetworkClient extends NetworkClient {
  final String baseUrl = 'https://pc-teach.onrender.com/';
  @override
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    log('');
    log('----------------');
    log('Request:$baseUrl$url');
    log('type: post');
    log('----------------');
    log('');
    http.Response response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    log('----------------');
    log('Request:$baseUrl$url');
    log('status: ${response.statusCode}');
    log('body: ${response.body}');
    log('----------------');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Map<String, dynamic>> get(String url) async {
    log('');
    log('----------------');
    log('Request:$baseUrl$url');
    log('type: get');
    log('----------------');
    log('');
    http.Response response = await http.get(
      Uri.parse('$baseUrl$url'),
      //https://pc-backend-cqbr.onrender.com/
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('----------------');
    log('Request:$baseUrl$url');
    log('status: ${response.statusCode}');
    log('body: ${response.body}');
    log('----------------');
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Map<String, dynamic>> delete(String url) async {
    log('');
    log('----------------');
    log('Request:$baseUrl$url');
    log('type: delete');
    log('----------------');
    log('');
    http.Response response = await http.delete(
      Uri.parse('$baseUrl$url'),
      //https://pc-backend-cqbr.onrender.com/
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('----------------');
    log('Request:$baseUrl$url');
    log('status: ${response.statusCode}');
    log('body: ${response.body}');
    log('----------------');
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Map<String, dynamic>> patch(String url, Map<String, dynamic> body) async {
    log('');
    log('----------------');
    log('Request:$baseUrl$url');
    log('type: patch');
    log('----------------');
    log('');
    http.Response response = await http.patch(
      Uri.parse('$baseUrl$url'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    log('----------------');
    log('Request:$baseUrl$url');
    log('status: ${response.statusCode}');
    log('body: ${response.body}');
    log('----------------');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw UnimplementedError();
    }
  }
}