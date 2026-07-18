class Activity {
  final String activityId;
  final String name;
  final String description;
  final List<dynamic> instructions;
  final String difficulty;
  final String estTime;
  final String associatedModule;
  final List<dynamic> associatedCompetencies;

  Activity ({
    required this.activityId,
    required this.name,
    required this.description,
    required this.instructions,
    required this.difficulty,
    required this.estTime,
    required this.associatedModule,
    required this.associatedCompetencies,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activityId: json["activityId"] as String, 
      name: json["name"] as String, 
      description: json["description"] as String, 
      instructions: json["instructions"] as List<dynamic>, 
      difficulty: json["difficulty"] as String, 
      estTime: json["estTime"] as String,
      associatedModule: json["associatedModule"] as String, 
      associatedCompetencies: json["associatedCompetencies"] as List<dynamic>, 
    );
  }
}