import 'package:f/core/network_client.dart';
import 'package:f/presentation/main_page/models/story_model.dart';

import '../../core/storage_service.dart';

abstract class MainService{
  Future<List<StoryModel>> getStories();
}

class IMainService implements MainService {
  final INetworkClient _networkClient = INetworkClient();
  final IStorageService _storageService = IStorageService();

  @override
  Future<List<StoryModel>> getStories() async {
    try {
      Map<String, dynamic> storyItems = {'items': []};
      List<StoryModel> stories = [];
      try {
        storyItems = await _networkClient.get('stories');
        stories = storyItems['items'].map<StoryModel>((json) =>
            StoryModel.fromJson(json)).toList();
      } catch (e) {
        print(e);
      }
      if (stories.isEmpty) {
        final storiesFromStorage = await _storageService.getStories();
        stories = storiesFromStorage['items'].map<StoryModel>((json) =>
            StoryModel.fromJson(json)).toList();
      } else {
        _storageService.setStories(storyItems);
      }
      return stories;
    } catch(e) {
      return [];
    }
  }
}