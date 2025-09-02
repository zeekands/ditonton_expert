import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/pages/popular_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_series_page_test.mocks.dart';
import 'package:feature_tv_series/presentaion/widget/tv_series_card.dart';

@GenerateMocks([PopularTvSeriesCubit])
void main() {
  late MockPopularTvSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockPopularTvSeriesCubit();
    when(mockCubit.stream)
        .thenAnswer((_) => const Stream<PopularTvSeriesState>.empty());
    when(mockCubit.fetchPopularTvSeries())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestable(Widget child) => BlocProvider<PopularTvSeriesCubit>.value(
        value: mockCubit,
        child: MaterialApp(home: child),
      );

  testWidgets('shows progress when loading', (tester) async {
    when(mockCubit.state).thenReturn(const PopularTvSeriesState.loading());

    await tester.pumpWidget(makeTestable(PopularTvSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('shows ListView when loaded', (tester) async {
    when(mockCubit.state)
        .thenReturn(PopularTvSeriesState.loaded(tvSeries: testTvSeriesList));

    await tester.pumpWidget(makeTestable(PopularTvSeriesPage()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('renders TvSeriesCard items when loaded', (tester) async {
    when(mockCubit.state)
        .thenReturn(PopularTvSeriesState.loaded(tvSeries: testTvSeriesList));

    await tester.pumpWidget(makeTestable(PopularTvSeriesPage()));

    expect(find.byType(TvSeriesCard), findsNWidgets(testTvSeriesList.length));
  });

  testWidgets('calls fetchPopularTvSeries on initState', (tester) async {
    when(mockCubit.state)
        .thenReturn(PopularTvSeriesState.loaded(tvSeries: testTvSeriesList));

    await tester.pumpWidget(makeTestable(PopularTvSeriesPage()));
    await tester.pump();

    verify(mockCubit.fetchPopularTvSeries()).called(1);
  });

  testWidgets('shows error message when error', (tester) async {
    when(mockCubit.state).thenReturn(
      const PopularTvSeriesState.error(message: 'Error message'),
    );

    await tester.pumpWidget(makeTestable(PopularTvSeriesPage()));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });
}
