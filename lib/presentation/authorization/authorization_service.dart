import 'package:f/core/network_client.dart';

abstract class AuthorizationService {
  Future<Map<String, dynamic>> registration(String login, String password);
}

class IAuthorizationService extends AuthorizationService {
  final INetworkClient _networkClient = INetworkClient();
  @override
  Future<Map<String, dynamic>> registration(String login, String password) async {
    try {
      final body = await _networkClient.post(
          'register',
          {
            'login':login,
            'password':password,
          }
      );
      if(body['success'] == false) {
        throw body['status_code'];
      }
      return body;
    } catch (e) {
      rethrow;
    }
  }
}