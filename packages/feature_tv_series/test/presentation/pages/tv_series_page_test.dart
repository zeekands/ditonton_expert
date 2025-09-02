import 'dart:async';

import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/pages/tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_page_test.mocks.dart';

@GenerateMocks([
  NowPlayingTvSeriesCubit,
  PopularTvSeriesCubit,
  TopRatedTvSeriesCubit,
])
void main() {
  late MockNowPlayingTvSeriesCubit nowPlayingCubit;
  late MockPopularTvSeriesCubit popularCubit;
  late MockTopRatedTvSeriesCubit topRatedCubit;

  setUp(() {
    nowPlayingCubit = MockNowPlayingTvSeriesCubit();
    popularCubit = MockPopularTvSeriesCubit();
    topRatedCubit = MockTopRatedTvSeriesCubit();

    // Avoid MissingStubError by stubbing stream + fetch methods
    when(nowPlayingCubit.stream)
        .thenAnswer((_) => const Stream<NowPlayingTvSeriesState>.empty());
    when(popularCubit.stream)
        .thenAnswer((_) => const Stream<PopularTvSeriesState>.empty());
    when(topRatedCubit.stream)
        .thenAnswer((_) => const Stream<TopRatedTvSeriesState>.empty());

    when(nowPlayingCubit.fetchNowPlayingTvSeries())
        .thenAnswer((_) async => Future<void>.value());
    when(popularCubit.fetchPopularTvSeries())
        .thenAnswer((_) async => Future<void>.value());
    when(topRatedCubit.fetchTopRatedTvSeries())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestable() => MultiBlocProvider(
        providers: [
          BlocProvider<NowPlayingTvSeriesCubit>.value(value: nowPlayingCubit),
          BlocProvider<PopularTvSeriesCubit>.value(value: popularCubit),
          BlocProvider<TopRatedTvSeriesCubit>.value(value: topRatedCubit),
        ],
        child: const MaterialApp(home: TvSeriesContent()),
      );

  testWidgets('shows loading indicators when loading', (tester) async {
    when(nowPlayingCubit.state)
        .thenReturn(const NowPlayingTvSeriesState.loading());
    when(popularCubit.state).thenReturn(const PopularTvSeriesState.loading());
    when(topRatedCubit.state).thenReturn(const TopRatedTvSeriesState.loading());

    await tester.pumpWidget(makeTestable());

    expect(find.byKey(const Key('loading_indicator_on_the_air')), findsOneWidget);
    expect(find.byKey(const Key('loading_indicator_popular')), findsOneWidget);
    expect(find.byKey(const Key('loading_indicator_top_rated')), findsOneWidget);
  });

  testWidgets('shows lists when loaded', (tester) async {
    when(nowPlayingCubit.state).thenReturn(
      NowPlayingTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );
    when(popularCubit.state).thenReturn(
      PopularTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );
    when(topRatedCubit.state).thenReturn(
      TopRatedTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );

    await tester.pumpWidget(makeTestable());

    expect(find.byType(TvSeriesList), findsNWidgets(3));
  });

  testWidgets('shows error texts when error', (tester) async {
    when(nowPlayingCubit.state).thenReturn(
      const NowPlayingTvSeriesState.error(message: 'Err1'),
    );
    when(popularCubit.state).thenReturn(
      const PopularTvSeriesState.error(message: 'Err2'),
    );
    when(topRatedCubit.state).thenReturn(
      const TopRatedTvSeriesState.error(message: 'Err3'),
    );

    await tester.pumpWidget(makeTestable());

    expect(find.byKey(const Key('error_message_on_the_air')), findsOneWidget);
    expect(find.byKey(const Key('error_message_popular')), findsOneWidget);
    expect(find.byKey(const Key('error_message_top_rated')), findsOneWidget);
  });
}

