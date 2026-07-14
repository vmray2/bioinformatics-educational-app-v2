import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/main.dart' as app;
import 'package:isar_community/isar.dart';
import 'helpers/perf_monitor.dart';

void main() {
  // Initalize the hardware bridge
  //IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Bind the target device driver context
  final IntegrationTestWidgetsFlutterBinding binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
      final existingInstance = Isar.getInstance();
      if (existingInstance != null) {
        await existingInstance.close(); 
      }

      IsarService().resetForTesting();
  });

  testWidgets('UI Frame Performance Benchmark Trace', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await binding.watchPerformance(() async {
        final Finder btn = find.byKey(const Key('welcome_go_to_dashboard_button'));
        
        await tester.tap(btn);
        await tester.pumpAndSettle();
      }, reportKey: 'dashboard_navigation_performance');
  });

  group('UI & System Resource Performance Tests', () {
    final monitor = PerfMonitor();

    testWidgets('Profile Welcome to Dashboard Transition Matrix', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      monitor.startSection();

      await binding.watchPerformance(() async {
        final Finder btn = find.byKey(const Key('welcome_go_to_dashboard_button'));
        expect(btn, findsOneWidget);
        
        await tester.tap(btn);
        await tester.pumpAndSettle();
      });

      final resourceMetrics = monitor.endSection('welcome_to_dashboard_transition');

      final Map<String, dynamic> combinedData = Map<String, dynamic>.from(binding.reportData ?? {});
      combinedData['system_resources'] = resourceMetrics;
      
      binding.reportData = combinedData;
      print('💾 Resource Footprint Logged: $resourceMetrics');
    });
  });

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