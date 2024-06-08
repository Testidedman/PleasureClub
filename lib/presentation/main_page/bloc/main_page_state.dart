import '../models/story_model.dart';

class MainPageState {
  MainPageState({
    this.isTap = true,
    this.stories = const [],
    this.isLoading = true
  });

  final bool isTap;
  final bool isLoading;
  final List<StoryModel> stories;

  MainPageState copyWith({bool? isTap, List<StoryModel>? stories, bool? isLoading}) {
    return MainPageState(
        isTap: isTap ?? this.isTap,
        stories: stories ?? this.stories,
        isLoading: isLoading ?? this.isLoading
    );
  }
}
