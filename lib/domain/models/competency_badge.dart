class CompetencyBadge {
  final String badgeId;
  final String name;
  final String description;
  final String imgPath;

  CompetencyBadge ({
    required this.badgeId,
    required this.name,
    required this.description,
    required this.imgPath,
  });

  factory CompetencyBadge.fromJson(Map<String, dynamic> json) {
    return CompetencyBadge(
      badgeId: json["badgeId"] as String, 
      name: json["name"] as String, 
      description: json["description"] as String, 
      imgPath: json["imgPath"] as String, 
    );
  }
}