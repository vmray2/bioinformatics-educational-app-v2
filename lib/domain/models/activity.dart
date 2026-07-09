class Activity {
  final String activityID;
  final String name;
  final String description;
  final String instructions;
  final String difficulty;
  final List<String> associatedModules;
  final List<String> associatedCompetencies;
  final DateTime lastAccessed;

  Activity ({
    required this.activityID,
    required this.name,
    required this.description,
    required this.instructions,
    required this.difficulty,
    required this.associatedModules,
    required this.associatedCompetencies,
    required this.lastAccessed
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activityID: json["activityID"] as String, 
      name: json["name"] as String, 
      description: json["description"] as String, 
      instructions: json["instructions"] as String, 
      difficulty: json["difficulty"] as String, 
      associatedModules: json["associatedModules"] as List<String>, 
      associatedCompetencies: json["associatedCompetencies"] as List<String>, 
      lastAccessed: json["lastAccessed"] as DateTime
    );
  }
}