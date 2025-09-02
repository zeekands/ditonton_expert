import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/pages/top_rated_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_series_page_test.mocks.dart';
import 'package:feature_tv_series/presentaion/widget/tv_series_card.dart';

@GenerateMocks([TopRatedTvSeriesCubit])
void main() {
  late MockTopRatedTvSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockTopRatedTvSeriesCubit();
    when(mockCubit.stream)
        .thenAnswer((_) => const Stream<TopRatedTvSeriesState>.empty());
    when(mockCubit.fetchTopRatedTvSeries())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestable(Widget child) => BlocProvider<TopRatedTvSeriesCubit>.value(
        value: mockCubit,
        child: MaterialApp(home: child),
      );

  testWidgets('shows progress when loading', (tester) async {
    when(mockCubit.state).thenReturn(const TopRatedTvSeriesState.loading());

    await tester.pumpWidget(makeTestable(TopRatedTvSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('shows ListView when loaded', (tester) async {
    when(mockCubit.state).thenReturn(
      TopRatedTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );

    await tester.pumpWidget(makeTestable(TopRatedTvSeriesPage()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('renders TvSeriesCard items when loaded', (tester) async {
    when(mockCubit.state).thenReturn(
      TopRatedTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );

    await tester.pumpWidget(makeTestable(TopRatedTvSeriesPage()));

    expect(find.byType(TvSeriesCard), findsNWidgets(testTvSeriesList.length));
  });

  testWidgets('calls fetchTopRatedTvSeries on initState', (tester) async {
    when(mockCubit.state).thenReturn(
      TopRatedTvSeriesState.loaded(tvSeries: testTvSeriesList),
    );

    await tester.pumpWidget(makeTestable(TopRatedTvSeriesPage()));
    await tester.pump();

    verify(mockCubit.fetchTopRatedTvSeries()).called(1);
  });

  testWidgets('shows error message when error', (tester) async {
    when(mockCubit.state)
        .thenReturn(const TopRatedTvSeriesState.error(message: 'Error message'));

    await tester.pumpWidget(makeTestable(TopRatedTvSeriesPage()));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });
}
