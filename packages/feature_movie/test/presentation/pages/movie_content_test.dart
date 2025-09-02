// test/features/movie_feature/presentation/pages/movie_content_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_state.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_state.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:feature_movie/presentation/pages/movie_list/movie_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_content_test.mocks.dart';

@GenerateMocks([NowPlayingMoviesCubit, PopularMoviesCubit, TopRatedMoviesCubit])
void main() {
  late MockNowPlayingMoviesCubit mockNowPlayingMoviesCubit;
  late MockPopularMoviesCubit mockPopularMoviesCubit;
  late MockTopRatedMoviesCubit mockTopRatedMoviesCubit;

  setUp(() {
    mockNowPlayingMoviesCubit = MockNowPlayingMoviesCubit();
    mockPopularMoviesCubit = MockPopularMoviesCubit();
    mockTopRatedMoviesCubit = MockTopRatedMoviesCubit();

    when(mockNowPlayingMoviesCubit.stream).thenAnswer((_) => Stream.empty());
    when(mockPopularMoviesCubit.stream).thenAnswer((_) => Stream.empty());
    when(mockTopRatedMoviesCubit.stream).thenAnswer((_) => Stream.empty());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesCubit>.value(
          value: mockNowPlayingMoviesCubit,
        ),
        BlocProvider<PopularMoviesCubit>.value(value: mockPopularMoviesCubit),
        BlocProvider<TopRatedMoviesCubit>.value(value: mockTopRatedMoviesCubit),
      ],
      child: MaterialApp(home: Scaffold(body: body)),
    );
  }

  void mockAllLoaded() {
    when(
      mockNowPlayingMoviesCubit.state,
    ).thenReturn(NowPlayingMoviesState.loaded(movies: testMovieList));
    when(
      mockPopularMoviesCubit.state,
    ).thenReturn(PopularMoviesState.loaded(movies: testMovieList));
    when(
      mockTopRatedMoviesCubit.state,
    ).thenReturn(TopRatedMoviesState.loaded(movies: testMovieList));
  }

  group('Now Playing Movies', () {
    testWidgets('Page should display progress bar when loading', (
      WidgetTester tester,
    ) async {
      when(
        mockNowPlayingMoviesCubit.state,
      ).thenReturn(const NowPlayingMoviesState.loading());
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      expect(progressBarFinder, findsWidgets);
    });

    testWidgets('Page should display ListView when data is loaded', (
      WidgetTester tester,
    ) async {
      when(
        mockNowPlayingMoviesCubit.state,
      ).thenReturn(NowPlayingMoviesState.loaded(movies: testMovieList));
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final listViewFinder = find.byKey(Key('now_playing_movies_list'));
      expect(listViewFinder, findsWidgets);
    });

    testWidgets('Page should display text with message when Error', (
      WidgetTester tester,
    ) async {
      mockAllLoaded();
      when(
        mockNowPlayingMoviesCubit.state,
      ).thenReturn(const NowPlayingMoviesState.error(message: 'Error message'));

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final textFinder = find.byKey(const Key('error_message_now_playing'));
      expect(textFinder, findsOneWidget);
    });
  });

  group('Popular Movies', () {
    testWidgets('Page should display progress bar when loading', (
      WidgetTester tester,
    ) async {
      when(
        mockPopularMoviesCubit.state,
      ).thenReturn(const PopularMoviesState.loading());
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      expect(progressBarFinder, findsWidgets);
    });

    testWidgets('Page should display ListView when data is loaded', (
      WidgetTester tester,
    ) async {
      when(
        mockPopularMoviesCubit.state,
      ).thenReturn(PopularMoviesState.loaded(movies: testMovieList));
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final listViewFinder = find.byKey(Key('popular_movies_list'));
      expect(listViewFinder, findsWidgets);
    });
  });

  group('Top Rated Movies', () {
    testWidgets('Page should display progress bar when loading', (
      WidgetTester tester,
    ) async {
      when(
        mockTopRatedMoviesCubit.state,
      ).thenReturn(const TopRatedMoviesState.loading());
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      expect(progressBarFinder, findsWidgets);
    });

    testWidgets('Page should display ListView when data is loaded', (
      WidgetTester tester,
    ) async {
      when(
        mockTopRatedMoviesCubit.state,
      ).thenReturn(TopRatedMoviesState.loaded(movies: testMovieList));
      mockAllLoaded();

      await tester.pumpWidget(makeTestableWidget(MovieContent()));

      final listViewFinder = find.byKey(Key('top_rated_movies_list'));
      expect(listViewFinder, findsWidgets);
    });
  });
}
