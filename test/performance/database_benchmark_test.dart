import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Isar db;

  setUpAll(() async {
    final dir = await getTemporaryDirectory();
    db = await Isar.open([UserProfileCollectionSchema], directory: dir.path);
  });

  tearDownAll(() async {
    await db.close(deleteFromDisk: true);
  });

  test('Isar Local Write Storage Latency Tracer', () async {
    final List<int> writeLatenciesMicros = [];
    
    // Simulate 100 transactions
    for (int i = 0; i < 100; i++) {
      final sampleProfile = UserProfileCollection()
        ..id = 1
        ..username = "Researcher_$i"
        ..currentLevel = i
        ..totalXp = i * 10
        ..accountCreated = DateTime.now()
        ..userTitle = "Novice"
        ..lastActiveSession = DateTime.now()
        ..consecutiveDays = 1;

      final stopwatch = Stopwatch()..start();
      
      await db.writeTxn(() async {
        await db.userProfileCollections.put(sampleProfile);
      });
      
      stopwatch.stop();
      writeLatenciesMicros.add(stopwatch.elapsedMicroseconds);
    }

    print('RAW_LATENCY_DATA: $writeLatenciesMicros');
  });
}