import 'dart:io';

import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/collections/user_progress_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/data/repositories/user_progress_repository.dart';
import 'package:binf_educational_app_redone/presentation/dashboard/dashboard_screen.dart';
import 'package:binf_educational_app_redone/presentation/providers/activity_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/badge_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/repository_provider.dart';
import 'package:binf_educational_app_redone/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:isar_community/isar.dart';

import 'helpers/mock_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Isar tempIsar;
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('integration_isar_');

    tempIsar = await Isar.open(
      [UserProfileCollectionSchema, UserProgressCollectionSchema],
      directory: tempDir.path,
      name: "dashboard_integration_test_db"
    );

    await tempIsar.writeTxn(() async {
      await tempIsar.userProfileCollections.put(mockProfile);
    });

    final entity = UserProgressCollection.fromDomain(mockProgress2);
    await tempIsar.writeTxn(() async { 
      await tempIsar.userProgressCollections.put(entity..id = 1);
    });
  });

  tearDown(() async {
    await tempIsar.close(deleteFromDisk: true);
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  testWidgets('Dashboard integration flow: DB loading, navigation, and locked checks', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          curriculumProvider.overrideWith((ref) async => mockCurriculum),
          activitiesProvider.overrideWith((ref) async => mockActivities),
          badgesProvider.overrideWith((ref) async => mockBadges),
          /*userProfileRepositoryProvider.overrideWithValue(
            UserProfileRepository(Future.value(tempIsar))
          ),*/
          userProgressRepositoryProvider.overrideWithValue(
            UserProgressRepository(localDb: IsarService())
          ),
          //isarServiceProvider.overrideWithValue(IsarService())
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: DashboardScreen(userProfile: mockProfile),
          //navigatorObservers: [mockObserver],
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 1));
    final progressFinder = find.byKey(const Key("dashboard_user_xp_bar"));
    final progressWidget = tester.widget<LinearProgressIndicator>(progressFinder);

    expect(progressWidget.value, equals(0.25));

    expect(find.byKey(const Key('dashboard_num_badges_unlocked')), findsOneWidget);
    expect(find.text('1/20'), findsOneWidget);

    expect(find.byKey(const Key('dashboard_user_level_and_title')), findsOneWidget);
    expect(find.text('Level 2: Genomics Specialist'), findsOneWidget);

    final unlockedModuleCard = find.text('Bioinformatics Applications');
    expect(unlockedModuleCard, findsOneWidget);

    await tester.tap(unlockedModuleCard);
    await tester.pumpAndSettle();

    // Verify detail screen loaded
    expect(find.text('Module 1 Overview'), findsOneWidget);

    final backButton = find.byType(BackButton);
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);

    final lockedModuleCard = find.text('Basics of Molecular Docking');
    await tester.tap(lockedModuleCard);
    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.text('Module 2 Overview'), findsNothing);
  });
}