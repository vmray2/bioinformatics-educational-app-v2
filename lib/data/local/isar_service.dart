import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  // 1. Create a private singleton instance
  static final IsarService _instance = IsarService._internal();
  
  // 2. Expose a public factory constructor to access the exact same instance everywhere
  factory IsarService() => _instance;
  
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
    return await Isar.open(
      [UserProfileCollectionSchema],
      directory: dir.path,
      inspector: false
    );
  }

  void resetForTesting() {
    _db = null;
  }
}