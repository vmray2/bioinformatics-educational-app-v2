import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';

class UserProfileRepository {
  final _db = IsarService().db;
  
  /// Fetches the single-user profile from local storage
  Future<UserProfileCollection?> fetchProfile() async {
    return await _db.userProfileCollections.get(1);
  }

  Future<UserProfileCollection> createProfile() async {
    final newProfile = UserProfileCollection()
      ..id = 1
      ..username = "Researcher"
      ..currentLevel = 1
      ..userTitle = "Novice"
      ..totalXp = 0
      ..accountCreated = DateTime.now()
      ..lastActiveSession = DateTime.now()
      ..consecutiveDays = 1;

    await _db.writeTxn(() async {
      await _db.userProfileCollections.put(newProfile);
    });

    return newProfile;
  }

  //Update user xp

  //Update user name
}