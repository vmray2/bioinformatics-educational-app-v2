import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/providers/query_builder_provider.dart';
import 'package:binf_educational_app_redone/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';


final filteredMoleculesStreamProvider =
  StreamProvider<List<MoleculeCollection>>((ref) {
    final filter = ref.watch(activeFilterProvider);
    
    final repository = ref.watch(moleculeRepositoryProvider);

    return repository.watchQuery(filter);
  });

final moleculeDetailStreamProvider = 
  StreamProvider.family<MoleculeCollection?, int>((ref, id) {
    final repository = ref.watch(moleculeRepositoryProvider);

    return repository.watchMoleculeById(id);
  });

final moleculeByStringIdStreamProvider = 
    StreamProvider.family<MoleculeCollection?, String>((ref, stringId) {
  final repository = ref.watch(moleculeRepositoryProvider);

  return repository.watchMoleculeByStringId(stringId);
});

class DockingData {
  final MoleculeCollection receptor;
  final List<MoleculeCollection> candidates;

  DockingData({
    required this.receptor,
    required this.candidates,
  });
}

@immutable
class DockingArgs {
  final String receptorId;
  final List<String> candidateIds;

  const DockingArgs({
    required this.receptorId,
    required this.candidateIds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DockingArgs &&
          receptorId == other.receptorId &&
          listEquals(candidateIds, other.candidateIds);

  @override
  int get hashCode => Object.hash(receptorId, Object.hashAll(candidateIds));
}

final dockingStreamProvider = StreamProvider.family<DockingData, DockingArgs>((ref, args) {
  final repository = ref.watch(moleculeRepositoryProvider);
  
  final allIds = [args.receptorId, ...args.candidateIds];

  return repository.watchMoleculesByStringIds(allIds).map((molecules) {
    final receptor = molecules.firstWhere(
      (m) => m.moleculeId == args.receptorId,
      orElse: () => throw Exception('Receptor ${args.receptorId} not found'),
    );

    final candidates = molecules
        .where((m) => args.candidateIds.contains(m.moleculeId))
        .toList();

    return DockingData(
      receptor: receptor,
      candidates: candidates,
    );
  });
});