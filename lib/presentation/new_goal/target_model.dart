class TargetModel {
  final String targetName;
  final String description;
  final String priority;

  TargetModel({
    required this.description,
    required this.targetName,
    required this.priority
  });

  factory TargetModel.fromJson(Map<String, dynamic> json) {
    return TargetModel(
        targetName: json['target_name'],
        description: json['description'],
        priority: json['priority']
    );
  }
}