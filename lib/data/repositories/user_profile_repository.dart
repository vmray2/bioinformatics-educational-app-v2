import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:isar_community/isar.dart';

class UserProfileRepository {
  final IsarService _localDb;

  UserProfileRepository({
    required IsarService localDb,
  }) : _localDb = localDb;

  Future<Isar> get _db async => await _localDb.db;

  /// Fetches the single-user profile from local storage
  Future<UserProfileCollection?> fetchProfile() async {
    final isar = await _db;
    var profile = await isar.userProfileCollections.get(1);

    profile ??= await createProfile();

    return profile;
  }

  Future<UserProfileCollection> createProfile() async {
    final isar = await _db;
    /*final List<String> competencyIdList = [
      "c1_role_of_bioinformatics", "c2_computational_concepts", "c3_statistical_concepts",
      "c4_bioinformatics_tools", "c5_data_retrieval", "c6_model",
      "c7_scripting", "c8_data_types", "c9_implications"
    ];*/

    final newProfile = UserProfileCollection()
      ..id = 1
      ..username = "Researcher"
      ..userTitle = "Novice"
      ..accountCreated = DateTime.now()
      ..lastActiveSession = DateTime.now()
      ..consecutiveDays = 1
      ..profileImgPath = "assets/img/Bioinformatics Computer Sprite 256.png";


    await isar.writeTxn(() async {
      await isar.userProfileCollections.put(newProfile);
    });

    return newProfile;
  }

  Future<Stream<List<UserProfileCollection>>> watchUserProfiles() async {
    final isar = await _db;
    return isar.userProfileCollections.where().watch();
  }
  
  Stream<UserProfileCollection?> watchProfile({int id = 1}) async* {
    final isar = await _db;
    yield* isar.userProfileCollections.watchObject(id, fireImmediately: true);
  }

  //Update user xp

  //Update user name
}