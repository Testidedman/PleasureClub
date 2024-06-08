class StoryModel {
  final String name;
  final String url;
  final String avatarUrl;
  final bool isVideo;

  StoryModel({
    required this.name,
    required this.url,
    required this.isVideo,
    required this.avatarUrl
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
        name: json['name'],
        url: json['url'],
        isVideo: json['is_video'],
        avatarUrl: json['avatar_url']
    );
  }
}