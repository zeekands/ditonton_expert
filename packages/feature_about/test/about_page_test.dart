import 'package:feature_about/feature_about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: child);

  testWidgets('renders AboutPage scaffold and app bar', (tester) async {
    await tester.pumpWidget(wrap(const AboutPage()));

    expect(find.byKey(const Key('about_page')), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('shows image asset and description text', (tester) async {
    await tester.pumpWidget(wrap(const AboutPage()));

    // Image exists and uses the correct asset path
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final asset = imageWidget.image as AssetImage;
    expect(
      asset.assetName,
      equals('packages/feature_about/assets/circle-g.png'),
    );

    expect(find.textContaining('aplikasi katalog film'), findsOneWidget);
  });
}
