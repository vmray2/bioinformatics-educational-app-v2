import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/domain/models/activity.dart';
import 'package:binf_educational_app_redone/domain/models/curriculum.dart';
import 'package:binf_educational_app_redone/domain/models/module.dart';
import 'package:binf_educational_app_redone/domain/models/competency_badge.dart';
import 'package:binf_educational_app_redone/domain/models/module_step.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
import 'package:binf_educational_app_redone/presentation/activity/activity_overview/activity_overview_screen.dart';
import 'package:binf_educational_app_redone/presentation/dashboard/dashboard_screen.dart';
import 'package:binf_educational_app_redone/presentation/module/module_overview_screen.dart';
import 'package:binf_educational_app_redone/providers/activity_provider.dart';
import 'package:binf_educational_app_redone/providers/badge_provider.dart';
import 'package:binf_educational_app_redone/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/providers/profile_provider.dart';
import 'package:binf_educational_app_redone/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_card.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/badge_card.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/module_card.dart';
import 'package:binf_educational_app_redone/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class FakeRoute extends Fake implements Route<dynamic> {}

class FakeUserProgressNotifier extends UserProgressNotifier {
  final UserProgress mockProgress;

  FakeUserProgressNotifier(this.mockProgress);

  @override
  UserProgress build() {
    return mockProgress;
  }
}

void main() {
setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  final mockModuleStepsMod1 = [
    ModuleStep(
      moduleStepId: "mod_1_step_1_what_is_bioinformatics_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
    ModuleStep(
      moduleStepId: "mod_1_step_2_what_is_bioinformatics_used_for_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
    ModuleStep(
      moduleStepId: "mod_1_step_3_who_can_use_bioinformatics_md", 
      title: "title", 
      type: "type", 
      markdownInstructions: "markdownInstructions", 
      imgPath: "imgPath", 
      hint: "hint", 
      estTime: "estTime", 
      description: "description"
    ),
  ];

  final mockModules = [
    Module(
      moduleId: "mod_1_bioinformatics_applications",
      moduleName: "Bioinformatics Applications",
      description: "",
      estTime: "",
      competenciesXp: {},
      moduleSteps: mockModuleStepsMod1
    ),
    Module(
      moduleId: "mod_2_basics_of_molecular_biology",
      moduleName: "Basics of Molecular Biology",
      description: "",
      estTime: "",
      competenciesXp: {},
      moduleSteps: []
    ),
  ];

  final mockCurriculum = Curriculum(
    catalogId: "", 
    catalogVersion: "catalogVersion", 
    totalModules: 9, 
    modules: mockModules
  );

  final mockActivities = [
    Activity(
      activityId: 'act_module_flashcards', 
      associatedModule: 'mod_1-9', 
      name: 'Module Flashcards',
      description: "",
      instructions: [],
      difficulty: "easy",
      estTime: "-",
      associatedCompetencies: []
    ),
    Activity(
      activityId: 'act_central_dogma_codon_slider', 
      associatedModule: 'mod_2_basics_of_molecular_biology', 
      name: 'Central Dogma Codon Slider',
      description: "",
      instructions: [],
      difficulty: "medium",
      estTime: "",
      associatedCompetencies: []
    ),  
  ];

  final mockBadges = [
    CompetencyBadge(
      badgeId: 'badge_01', 
      name: 'Badge 1', 
      description: 'Unlocked',
      imgPath: "assets/img/Bioinformatics Computer Sprite 256.png"
    ),
    CompetencyBadge(
      badgeId: 'badge_02', 
      name: 'Badge 2', 
      description: 'Locked',
      imgPath: "assets/img/Bioinformatics Computer Sprite 256.png"
    ),
  ];

  final mockProgress = UserProgress(
    unlockedModuleIds: const {'mod_1_bioinformatics_applications'}, 
    unlockedActivityIds: const {'act_module_flashcards'}, 
    unlockedBadgeIds: const {'badge_01'}, 
    userMetrics: const UserMetrics(totalXp: 250, currentLevel: 2),
    moduleStepMetrics: {
      "mod_1_step_1_what_is_bioinformatics_md": ModuleStepMetrics(isCompleted: true, status: 2, lastAccessed: DateTime.now()),
      "mod_1_step_2_what_is_bioinformatics_used_for_md": ModuleStepMetrics(isCompleted: false, status: 1, lastAccessed: DateTime.now()),
      "mod_1_step_3_who_can_use_bioinformatics_md": ModuleStepMetrics(isCompleted: false, status: 0, lastAccessed: DateTime.now())
    }
  );

  final mockProfile =  UserProfileCollection.create(
    username: "Researcher",
    userTitle: 'Genomics Specialist',
    profileImgPath: "",
    accountCreated: DateTime.now(),
    lastActiveSession: DateTime.now(),
    consecutiveDays: 2
  );

  Widget buildTestableWidget({required NavigatorObserver mockObserver}) {
    return ProviderScope(
      overrides: [
        curriculumProvider.overrideWith((ref) async => mockCurriculum),
        activitiesProvider.overrideWith((ref) async => mockActivities),
        badgesProvider.overrideWith((ref) async => mockBadges),
      
        userProgressProvider.overrideWith((ref) => Stream.value(mockProgress)),
        startupProfileProvider.overrideWith((ref) async => mockProfile),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: DashboardScreen(),
        navigatorObservers: [mockObserver],
      ),
    );
  }

  group("Dashboard Screen Widget Tests", () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Renders level, title, XP bar, and badge count correctly', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle();

      final progressFinder = find.byKey(const Key("dashboard_user_xp_bar"));
      final progressWidget = tester.widget<LinearProgressIndicator>(progressFinder);

      expect(progressWidget.value, equals(0.25));

      expect(find.byKey(const Key('dashboard_num_badges_unlocked')), findsOneWidget);
      expect(find.text('1/20'), findsOneWidget);

      expect(find.byKey(const Key('dashboard_user_level_and_title')), findsOneWidget);
      expect(find.text('Level 2: Genomics Specialist'), findsOneWidget);
    });

    testWidgets('Displays correct information and lock statuses for modules', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle(); 

      expect(find.byKey(const Key('dashboard_module_card_mod_1_bioinformatics_applications')), findsOneWidget);
      expect(find.text('Module 1'), findsOneWidget);
      expect(find.text('1/3'), findsOneWidget);

      final cardFinderMod1 = find.widgetWithText(ModuleCard, 'Bioinformatics Applications');

      await tester.scrollUntilVisible(
        cardFinderMod1,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final module1ProgressFinder = find.descendant(
        of: cardFinderMod1,
        matching: find.byType(CircularProgressIndicator),
      );

      expect(module1ProgressFinder, findsOneWidget);

      final indicator = tester.widget<CircularProgressIndicator>(module1ProgressFinder);
      expect(indicator.value, equals(1/3));


      expect(find.byKey(const Key('dashboard_module_card_mod_2_basics_of_molecular_biology')), findsOneWidget);
      //expect(find.text('Module 2'), findsOneWidget);

      final cardFinderMod2 = find.widgetWithText(ModuleCard, 'Basics of Molecular Biology');

      await tester.scrollUntilVisible(
        cardFinderMod2,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final module2ProgressFinder = find.descendant(
        of: cardFinderMod2,
        matching: find.byIcon(Icons.lock),
      );

      expect(module2ProgressFinder, findsOneWidget);

      final module2TitleFinder = find.descendant(
        of: cardFinderMod2,
        matching: find.text("Module 2"),
      );

      expect(module2TitleFinder, findsOneWidget);
    });

    testWidgets('Displays correct information and lock statuses for activities', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle(); 

      final cardFinderAct1 = find.widgetWithText(ActivityCard, 'Module Flashcards');

      await tester.scrollUntilVisible(
        cardFinderAct1,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final activity1ProgressFinder = find.descendant(
        of: cardFinderAct1,
        matching: find.byIcon(Icons.lock),
      );

      expect(activity1ProgressFinder, findsNothing);

      expect(find.byKey(const Key('dashboard_activity_card_act_module_flashcards')), findsOneWidget);
      expect(find.text('Module 1-9'), findsOneWidget);

      final activity1SubtextFinder = find.descendant(
        of: cardFinderAct1,
        matching: find.text("Module 1-9"),
      );

      expect(activity1SubtextFinder, findsOneWidget);

      final activity1DifficultyFinder = find.descendant(
        of: cardFinderAct1,
        matching: find.byIcon(Icons.circle),
      );

      expect(activity1DifficultyFinder, findsOneWidget);


      expect(find.byKey(const Key('dashboard_activity_card_act_central_dogma_codon_slider')), findsOneWidget);
      expect(find.text('Central Dogma Codon Slider'), findsOneWidget);

      final cardFinderAct2 = find.widgetWithText(ActivityCard, 'Central Dogma Codon Slider');

      await tester.scrollUntilVisible(
        cardFinderAct2,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final activity2ProgressFinder = find.descendant(
        of: cardFinderAct2,
        matching: find.byIcon(Icons.lock),
      );

      expect(activity2ProgressFinder, findsOneWidget);

      final activity2SubtextFinder = find.descendant(
        of: cardFinderAct2,
        matching: find.text("Module 2"),
      );

      expect(activity2SubtextFinder, findsOneWidget);

      final activity2DifficultyFinder = find.descendant(
        of: cardFinderAct2,
        matching: find.byIcon(Icons.square),
      );

      expect(activity2DifficultyFinder, findsOneWidget);
    });

    testWidgets('Displays correct information and lock statuses for badges', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle(); 

      final cardFinderBadge1 = find.widgetWithText(BadgeCard, 'Badge 1');

      await tester.scrollUntilVisible(
        cardFinderBadge1,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final badge1ProgressFinder = find.descendant(
        of: cardFinderBadge1,
        matching: find.byIcon(Icons.lock),
      );

      expect(badge1ProgressFinder, findsNothing);

      final imageFinder = find.descendant(
        of: cardFinderBadge1,
        matching: find.byType(Image),
      );

      expect(imageFinder, findsOneWidget);

      final imageWidget = tester.widget<Image>(imageFinder);

      expect(imageWidget.image, isA<AssetImage>());
      final assetImage = imageWidget.image as AssetImage;
      
      expect(assetImage.assetName, equals('assets/img/Bioinformatics Computer Sprite 256.png'));



      final cardFinderBadge2 = find.widgetWithText(BadgeCard, 'Badge 2');

      await tester.scrollUntilVisible(
        cardFinderBadge2,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      final badge2ProgressFinder = find.descendant(
        of: cardFinderBadge2,
        matching: find.byIcon(Icons.lock),
      );

      expect(badge2ProgressFinder, findsOneWidget);

      final badge2ImageFinder = find.descendant(
        of: cardFinderBadge2,
        matching: find.byType(Image),
      );

      expect(badge2ImageFinder, findsOneWidget);

      final badge2ImageWidget = tester.widget<Image>(badge2ImageFinder);

      expect(badge2ImageWidget.image, isA<AssetImage>());
      final badge2AssetImage = imageWidget.image as AssetImage;
      
      expect(badge2AssetImage.assetName, equals('assets/img/Bioinformatics Computer Sprite 256.png'));
    });

    testWidgets('Tapping an unlocked module triggers navigation to overview screen', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Bioinformatics Applications'));
      await tester.pumpAndSettle();

      verify(() => mockObserver.didPush(captureAny(), captureAny())).called(greaterThan(1));

      await tester.pumpAndSettle();
    });

    testWidgets('Tapping a locked module does not trigger navigation', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle();

      final cardFinder = find.widgetWithText(ModuleCard, 'Basics of Molecular Biology');

      await tester.scrollUntilVisible(
        cardFinder,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );

      await tester.pumpAndSettle();

      await tester.tap(cardFinder);
      await tester.pumpAndSettle();

      expect(find.byType(DashboardScreen), findsOneWidget);

      expect(find.byType(ModuleOverviewScreen), findsNothing);    
  });

    testWidgets('Tapping an unlocked activity navigates to activity overview', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Module Flashcards'));
      await tester.pumpAndSettle();

      verify(() => mockObserver.didPush(captureAny(), captureAny())).called(greaterThan(1));
    });

    testWidgets('Tapping a locked activity does not trigger navigation', (tester) async {
      await tester.pumpWidget(buildTestableWidget(mockObserver: mockObserver));
      await tester.pumpAndSettle();

      final cardFinder = find.widgetWithText(ActivityCard, 'Central Dogma Codon Slider');

      await tester.scrollUntilVisible(
        cardFinder,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );

      await tester.pumpAndSettle();

      await tester.tap(cardFinder);
      await tester.pumpAndSettle();

      expect(find.byType(DashboardScreen), findsOneWidget);

      expect(find.byType(ActivityOverviewScreen), findsNothing);   
    });
  });
}

