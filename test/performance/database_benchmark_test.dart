import 'dart:io';

import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:isar_community/isar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Isar db;
  late Directory tempDir;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('db_benchmark_');

    db = await Isar.open(
      [UserProfileCollectionSchema],
      directory: tempDir.path,
    );

    // IsarService.db = db; 
  });

  tearDown(() async {
    await db.close(deleteFromDisk: true);
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('Database Performance Benchmarks', () {
    test('Simulate 1,000 profile write transactions', () async {
      final List<int> writeLatenciesMicros = [];

      final stopwatch = Stopwatch()..start();

      await db.writeTxn(() async {
        for (int i = 0; i < 1000; i++) {
          final profile = UserProfileCollection.create(
            id: i + 1,
            username: "Researcher_$i",
            profileImgPath: "",
            accountCreated: DateTime.now(),
            userTitle: "Novice",
            lastActiveSession: DateTime.now(),
            consecutiveDays:1,
          );
          
          final stopwatch2 = Stopwatch()..start();

          await db.userProfileCollections.put(profile);

          stopwatch2.stop();

          writeLatenciesMicros.add(stopwatch2.elapsedMicroseconds);
        }
      });

      stopwatch.stop();

      print('1,000 Write Transactions Completed In: ${stopwatch.elapsedMilliseconds} ms');
      
      print('RAW_LATENCY_DATA: $writeLatenciesMicros');

      expect(await db.userProfileCollections.count(), equals(1000));
    });
  });


}