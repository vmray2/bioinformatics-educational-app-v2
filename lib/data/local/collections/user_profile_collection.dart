import 'package:isar_community/isar.dart';

part 'user_profile_collection.g.dart';

@Collection()
class UserProfileCollection {
  Id id = 1;

  late String username;
  late int currentLevel;
  late int totalXp;
  late List<CompetencyXp> competencyXp;
  late int xpForCompletion = 1000;

  late String userTitle;
  late DateTime accountCreated;
  late DateTime lastActiveSession;
  late int consecutiveDays;

  @ignore
  int get userLevel {
    double xpPercent = this.totalXp / this.xpForCompletion;
    int level = (xpPercent * 10).floor() + 1;

    return level;
  }

  @ignore
  double get levelProgressPercentage {
    double xpPercent = this.totalXp / this.xpForCompletion;
    double progressPercentage = xpPercent - (this.currentLevel - 1);

    return progressPercentage;
  }

}

@Embedded()
class CompetencyXp {
  late String competencyId;
  late int totalXp;
}