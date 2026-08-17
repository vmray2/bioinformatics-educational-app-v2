class BindingLigand {
  final String id;
  final String ligandMoleculeId;
  final String receptorPocketId;
  final String name;
  final bool isKnownBinder;
  final String feedback;
  final double pocketMatchScore;

  
  const BindingLigand({
    required this.id,
    required this.name, 
    required this.ligandMoleculeId, 
    required this.isKnownBinder, 
    required this.feedback,
    required this.pocketMatchScore, 
    required this.receptorPocketId
  });

  factory BindingLigand.fromJson(Map<String, dynamic> json) {
    return BindingLigand(
      id: json['id'] as String,
      isKnownBinder: json["isKnownBinder"] as bool,
      name: json['name'] as String, 
      ligandMoleculeId: json["ligandMoleculeId"] as String, 
      feedback: json["feedback"] as String,
      pocketMatchScore: json["pocketMatchScore"] as double,
      receptorPocketId: json["receptorPocketId"] as String
    );
  }
}