class Competency {
  final String competencyId;
  final String name;
  final String description;
  final List<String> associatedModules;
  final List<String> associatedActivities;
  final int xpForCompletion;

  Competency ({
    required this.competencyId,
    required this.name,
    required this.description,
    required this.associatedModules,
    required this.associatedActivities,
    required this.xpForCompletion,
  });

  factory Competency.fromJson(Map<String, dynamic> json) {
    return Competency(
      competencyId: json["competencyId"] as String, 
      name: json["name"] as String, 
      description: json["description"] as String, 
      associatedModules: json["associatedModules"] as List<String>, 
      associatedActivities: json["associatedActivities"] as List<String>, 
      xpForCompletion: json["xpForCompletion"] as int
    );
  }
}