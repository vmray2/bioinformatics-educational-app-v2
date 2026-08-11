class ReceptorPocket {
  final String id;
  final String moleculeId;
  final String name;
  final double minMolecularWeight;
  final double maxMolecularWeight;
  final List<dynamic> requiredHydrogenBondAcceptorRange;
  final List<dynamic> requiredHydrogenBondDonorRange;
  final int minHydrophobicFeatures;
  final String preferredEnvironment;


  const ReceptorPocket({
    required this.id,
    required this.name,
    required this.moleculeId, 
    required this.minMolecularWeight, 
    required this.maxMolecularWeight, 
    required this.minHydrophobicFeatures, 
    required this.preferredEnvironment, 
    required this.requiredHydrogenBondAcceptorRange, 
    required this.requiredHydrogenBondDonorRange,
  });

  factory ReceptorPocket.fromJson(Map<String, dynamic> json) {
    return ReceptorPocket(
      id: json['id'] as String,
      moleculeId: json['moleculeId'] as String,
      name: json['name'] as String, 
      minMolecularWeight: json["minMolecularWeight"] as double, 
      maxMolecularWeight: json["maxMolecularWeight"] as double,  
      preferredEnvironment: json["preferredEnvironment"] as String, 
      minHydrophobicFeatures: json["minHydrophobicFeatures"] as int, 
      requiredHydrogenBondAcceptorRange: json["requiredHydrogenBondAcceptorRange"] as List<dynamic>, 
      requiredHydrogenBondDonorRange: json["requiredHydrogenBondDonorRange"] as List<dynamic>,
    );
  }
}