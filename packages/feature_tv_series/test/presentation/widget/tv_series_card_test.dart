import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/presentaion/widget/tv_series_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TvSeriesCard shows title and overview', (tester) async {
    final tv = TvSeries.watchlist(
      id: 1,
      name: 'A Show',
      posterPath: '/p.jpg',
      overview: 'Desc',
    );

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: TvSeriesCard(tv))),
    );

    expect(find.text('A Show'), findsOneWidget);
    expect(find.text('Desc'), findsOneWidget);
  });
}

