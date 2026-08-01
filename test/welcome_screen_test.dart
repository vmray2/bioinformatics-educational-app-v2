import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/repositories/user_profile_repository.dart';
import 'package:binf_educational_app_redone/presentation/welcome/welcome_screen.dart';
import 'package:binf_educational_app_redone/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:binf_educational_app_redone/providers/profile_provider.dart';

class MockProfileRepository extends Mock implements UserProfileRepository {}

void main() {
  late MockProfileRepository mockRepo;

  setUp(() {
    mockRepo = MockProfileRepository();
  });

  testWidgets('Should display standard welcome text when no user profile exists', (WidgetTester tester) async {
    // Get null for the user profile
    when(() => mockRepo.fetchProfile()).thenAnswer((_) async => null);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userProfileRepositoryProvider.overrideWithValue(mockRepo),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const WelcomeScreen()
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the correct text is being displayed for a new user
    expect(find.byKey(const Key('welcome_title_text')), findsOneWidget);
    expect(find.text('Welcome New User!'), findsOneWidget);
    expect(find.text('Welcome Back, Researcher!'), findsNothing);
  });

  testWidgets('Should display welcome back text when returning user record found', (WidgetTester tester) async {
    final fakeProfile = UserProfileCollection()
      ..id = 1
      ..username = "John Smith"
      ..userTitle = "Novice"
      ..profileImgPath = ""
      ..accountCreated = DateTime.now()
      ..lastActiveSession = DateTime.now()
      ..consecutiveDays = 2;

    // Get the fake user profile
    when(() => mockRepo.fetchProfile()).thenAnswer((_) async => fakeProfile);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [userProfileRepositoryProvider.overrideWithValue(mockRepo)],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const WelcomeScreen()
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify the correct text is being displayed for a returning user
    expect(find.byKey(const Key('welcome_title_text')), findsOneWidget);
    expect(find.text('Welcome Back, John Smith!'), findsOneWidget);
    expect(find.text('Welcome New User!'), findsNothing);
  });


  testWidgets('Should display Start Learning text on button for new user', (WidgetTester tester) async {
    // Get null for the user profile
    when(() => mockRepo.fetchProfile()).thenAnswer((_) async => null);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userProfileRepositoryProvider.overrideWithValue(mockRepo),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const WelcomeScreen()
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the correct button text is being displayed for a new user
    expect(find.byKey(const Key('welcome_go_to_dashboard_button')), findsOneWidget);
    expect(find.text('Start Learning'), findsOneWidget);
    expect(find.text('Resume Learning'), findsNothing);
  });

  testWidgets('Should display Resume Learning text on button for returning user', (WidgetTester tester) async {
    final fakeProfile = UserProfileCollection()
      ..id = 1
      ..username = "John Smith"
      ..userTitle = "Novice"
      ..profileImgPath = ""
      ..accountCreated = DateTime.now()
      ..lastActiveSession = DateTime.now()
      ..consecutiveDays = 2;

    // Get the fake user profile
    when(() => mockRepo.fetchProfile()).thenAnswer((_) async => fakeProfile);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [userProfileRepositoryProvider.overrideWithValue(mockRepo)],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const WelcomeScreen()
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify the correct button text is being displayed for a returning user
    expect(find.byKey(const Key('welcome_go_to_dashboard_button')), findsOneWidget);
    expect(find.text('Resume Learning'), findsOneWidget);
    expect(find.text('Start Learning'), findsNothing);
  });
}