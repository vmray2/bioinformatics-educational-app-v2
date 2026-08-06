import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/collections/user_progress_collection.dart';
import 'package:binf_educational_app_redone/services/database_seeder.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal(); // Private singleton instance
  
  factory IsarService() => _instance; // Public factory constructor to access the exact same instance everywhere

  IsarService._internal();

  Future<Isar>? _db;

  Future<Isar> get db {
    if (_db != null && Isar.getInstance() != null) {
      return _db!;
    }
    
    _db = _openDB();
    return _db!;
  }

  Future<Isar> _openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar =  await Isar.open(
      [
        UserProfileCollectionSchema,
        UserProgressCollectionSchema,
        MoleculeCollectionSchema
      ],
      directory: dir.path,
      inspector: false
    );

    await DatabaseSeeder.seedMoleculesIfEmpty(isar);

    return isar;
  }

  void resetForTesting() {
    _db = null;
  }
}