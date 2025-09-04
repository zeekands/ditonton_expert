import 'package:feature_about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getApplicationSupportDirectory':
        case 'getApplicationDocumentsDirectory':
        case 'getTemporaryDirectory':
          return '/tmp';
        default:
          return null;
      }
    },
  );

  testWidgets('About page renders', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));
    expect(find.byKey(const Key('about_page')), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });
}
