import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/providers/query_builder_provider.dart';
import 'package:binf_educational_app_redone/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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