// test/features/movie_feature/presentation/pages/top_rated_movies_page_test.dart
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:feature_movie/presentation/pages/top_rated/top_rated_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_page_test.mocks.dart';

@GenerateMocks([TopRatedMoviesCubit])
void main() {
  late MockTopRatedMoviesCubit mockCubit;

  setUp(() {
    mockCubit = MockTopRatedMoviesCubit();
    // Stub frequently accessed members to avoid MissingStubError
    when(mockCubit.stream)
        .thenAnswer((_) => const Stream<TopRatedMoviesState>.empty());
    when(mockCubit.fetchTopRatedMovies())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMoviesCubit>.value(
      value: mockCubit,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const TopRatedMoviesState.loading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(TopRatedMoviesState.loaded(movies: testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(const TopRatedMoviesState.error(message: 'Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
