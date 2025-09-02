import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui/widget/rating_bar.dart';

void main() {
  Widget buildApp(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('RatingBarIndicator builds horizontally with given count', (tester) async {
    await tester.pumpWidget(buildApp(
      Directionality(
        textDirection: TextDirection.ltr,
        child: RatingBarIndicator(
          itemCount: 5,
          rating: 2.5,
          itemSize: 24,
          itemBuilder: const Icon(Icons.star).builder,
        ),
      ),
    ));

    expect(find.byType(RatingBarIndicator), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('RatingBarIndicator supports RTL textDirection', (tester) async {
    await tester.pumpWidget(buildApp(
      Directionality(
        textDirection: TextDirection.rtl,
        child: RatingBarIndicator(
          itemCount: 3,
          rating: 1.5,
          itemSize: 16,
          textDirection: TextDirection.rtl,
          itemBuilder: const Icon(Icons.star).builder,
        ),
      ),
    ));

    expect(find.byType(RatingBarIndicator), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });
}

extension on Icon {
  IndexedWidgetBuilder get builder => (context, index) => this;
}
