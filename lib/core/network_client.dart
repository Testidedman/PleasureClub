import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class NetworkClient {
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body);
}

class INetworkClient extends NetworkClient {
  @override
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    http.Response response = await http.post(
      Uri.parse('http://80.90.185.153:5002/api/$url'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw UnimplementedError();
    }
  }
}