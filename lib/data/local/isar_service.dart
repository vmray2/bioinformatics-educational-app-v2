import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  // 1. Create a private singleton instance
  static final IsarService _instance = IsarService._internal();
  
  // 2. Expose a public factory constructor to access the exact same instance everywhere
  factory IsarService() => _instance;
  
  IsarService._internal();

  // The actual database reference hidden inside the service
  late final Isar db;

  /// Runs the async boot process exactly once at app launch
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    
    db = await Isar.open(
      [UserProfileCollectionSchema],
      directory: dir.path,
    );
  }
}