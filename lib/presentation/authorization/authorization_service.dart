import 'package:f/core/network_client.dart';

abstract class AuthorizationService {
  Future<Map<String, dynamic>> registration(String login, String password);
}

class IAuthorizationService extends AuthorizationService {
  final INetworkClient _networkClient = INetworkClient();
  @override
  Future<Map<String, dynamic>> registration(String login, String password) async {
    final body = await _networkClient.post(
        'auth/registration',
        {
          'email':login,
          'password':password,
          'role': 'user'
        }
    );
    return body;
  }
}