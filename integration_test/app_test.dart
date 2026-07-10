import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/main.dart' as app;

void main() {
  // Initalize the hardware bridge
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Bind the target device driver context
  //final IntegrationTestWidgetsFlutterBinding binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('End-to-End Onboarding Execution Trace Tracker', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Take snapshot of intial welcome screen
    //await binding.takeScreenshot('welcome_screen');

    // Track timing metrics for analytical evaluation 
    final int renderStartTime = DateTime.now().millisecondsSinceEpoch;

    // Verify welcome screen visibility
    expect(find.byKey(const Key('welcome_title_text')), findsOneWidget);

    // Tap the button to navigate to the dashboard screen
    final Finder navigationButton = find.byKey(const Key('welcome_go_to_dashboard_button'));
    await tester.tap(navigationButton);
    
    // Process UI screen transitions
    await tester.pumpAndSettle();

    final int executionEndTime = DateTime.now().millisecondsSinceEpoch;
    final int operationalLatency = executionEndTime - renderStartTime;

    // Take another snapshot after navigating
    //await binding.takeScreenshot('dashboard_screen');

    // Assert view transition success state
    expect(find.text('Dashboard Screen'), findsOneWidget);
    
    // Print out exact benchmark variables directly into your test logs
    print('METRIC: Complete Welcome to Dashboard Screen Navigation Duration: $operationalLatency ms');
  });
}