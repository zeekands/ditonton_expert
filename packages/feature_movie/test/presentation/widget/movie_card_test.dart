import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/presentation/widget/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MovieCard shows title and overview', (tester) async {
    final movie = Movie.watchlist(
      id: 1,
      overview: 'Overview',
      posterPath: '/p.jpg',
      title: 'A Movie',
    );

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: MovieCard(movie))),
    );

    expect(find.text('A Movie'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
  });
}

