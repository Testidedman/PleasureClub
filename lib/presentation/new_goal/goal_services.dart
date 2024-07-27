import 'package:f/core/network_client.dart';

abstract class TargetService{
  Future<void> createGoal(String targetName, String description, String priority);
}

class ITargetService implements TargetService {
  final INetworkClient _networkClient = INetworkClient();

  @override
  Future<void> createGoal(
      String targetName,
      String description,
      String priority
      ) async {
    try {
      final targets = await _networkClient.post(
          'target',
          {
            'target_name': targetName,
            'description':description,
            'priority': priority
          }
      );
      if(targets['success'] == false) {
        throw targets['status_code'];
      }
    } catch (e) {
      rethrow;
    }
  }
}