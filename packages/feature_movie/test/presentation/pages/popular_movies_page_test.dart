// test/features/movie_feature/presentation/pages/popular_movies_page_test.dart
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_state.dart';
import 'package:feature_movie/presentation/pages/popular/popular_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_movies_page_test.mocks.dart';

@GenerateMocks([PopularMoviesCubit])
void main() {
  late MockPopularMoviesCubit mockCubit;

  setUp(() {
    mockCubit = MockPopularMoviesCubit();
    when(mockCubit.stream)
        .thenAnswer((_) => const Stream<PopularMoviesState>.empty());
    when(mockCubit.fetchPopularMovies())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<PopularMoviesCubit>.value(
      value: mockCubit,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const PopularMoviesState.loading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(PopularMoviesState.loaded(movies: testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(const PopularMoviesState.error(message: 'Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
