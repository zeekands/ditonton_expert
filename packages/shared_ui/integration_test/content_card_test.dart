import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_ui/widget/content_card.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class _FakeContent implements Content {
  @override
  int get id => 1;

  @override
  String get contentType => ContentType.movie;

  @override
  String? get overview => 'overview';

  @override
  String? get posterPath => '/p.jpg';

  @override
  String? get title => 'title';
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Initialize sqflite ffi for cache manager used by CachedNetworkImage
  databaseFactory = databaseFactoryFfi;
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

  testWidgets('ContentCard renders and handles tap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ContentCard(
            content: _FakeContent(),
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('title'), findsOneWidget);
    await tester.tap(find.byType(ContentCard));
    expect(tapped, isTrue);
  });
}
