import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:isar_community/isar.dart';

class UserProfileRepository {
  final Future<Isar> _db;

  UserProfileRepository(this._db);  

  /// Fetches the single-user profile from local storage
  Future<UserProfileCollection?> fetchProfile() async {
    final isar = await _db;
    return await isar.userProfileCollections.get(1);
  }

  Future<UserProfileCollection> createProfile() async {
    final isar = await _db;
    final List<String> competencyIdList = [
      "c1_role_of_bioinformatics", "c2_computational_concepts", "c3_statistical_concepts",
      "c4_bioinformatics_tools", "c5_data_retrieval", "c6_model",
      "c7_scripting", "c8_data_types", "c9_implications"
    ];

    final newProfile = UserProfileCollection()
      ..id = 1
      ..username = "Researcher"
      ..currentLevel = 1
      ..userTitle = "Novice"
      ..totalXp = 0
      ..accountCreated = DateTime.now()
      ..lastActiveSession = DateTime.now()
      ..consecutiveDays = 1
      ..competencyXp = competencyIdList.map((e) => CompetencyXp()
        ..competencyId = e
        ..totalXp = 0
      ).toList();

    await isar.writeTxn(() async {
      await isar.userProfileCollections.put(newProfile);
    });

    return newProfile;
  }

  Future<Stream<List<UserProfileCollection>>> watchUserProfiles() async {
    final isar = await _db;
    return isar.userProfileCollections.where().watch();
  }
  
  //Update user xp

  //Update user name
}