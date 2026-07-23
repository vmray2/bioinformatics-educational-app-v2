import 'package:isar_community/isar.dart';

part 'user_profile_collection.g.dart';

@Collection()
class UserProfileCollection {
  Id id = 1;

  late String username;
  late String profileImgPath = "";
  late String userTitle;
  late DateTime accountCreated;
  late DateTime lastActiveSession;
  late int consecutiveDays;

  UserProfileCollection();

  UserProfileCollection.create({
    this.id = 1,
    required this.username,
    required this.profileImgPath,
    required this.userTitle,
    required this.accountCreated,
    required this.lastActiveSession,
    required this.consecutiveDays,
  });

  UserProfileCollection copyWith({
    String? username,
    String? profileImgPath,
    String? userTitle,
    DateTime? accountCreated,
    DateTime? lastActiveSession,
    int? consecutiveDays
  }) {
    return UserProfileCollection()
      ..id = id
      ..username = username ?? this.username
      ..userTitle = userTitle ?? this.userTitle
      ..profileImgPath = profileImgPath ?? this.profileImgPath
      ..accountCreated = accountCreated ?? this.accountCreated
      ..lastActiveSession = lastActiveSession ?? this.lastActiveSession
      ..consecutiveDays = consecutiveDays ?? this.consecutiveDays;
  }
}