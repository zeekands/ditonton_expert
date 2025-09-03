import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/pages/detail_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/services.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_page_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetailUseCase,
  GetTvSeriesRecommendationsUseCase,
  GetWatchlistStatusTvSeriesUseCase,
  SaveWatchlistTvSeriesUseCase,
  RemoveWatchlistTvSeriesUseCase,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Stub Firebase Analytics method channel to no-op in tests
  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/firebase_analytics')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
  });
  late MockGetTvSeriesDetailUseCase mockGetDetail;
  late MockGetTvSeriesRecommendationsUseCase mockGetRecs;
  late MockGetWatchlistStatusTvSeriesUseCase mockGetStatus;
  late MockSaveWatchlistTvSeriesUseCase mockSave;
  late MockRemoveWatchlistTvSeriesUseCase mockRemove;
  late TvSeriesDetailCubit cubit;

  setUp(() {
    mockGetDetail = MockGetTvSeriesDetailUseCase();
    mockGetRecs = MockGetTvSeriesRecommendationsUseCase();
    mockGetStatus = MockGetWatchlistStatusTvSeriesUseCase();
    mockSave = MockSaveWatchlistTvSeriesUseCase();
    mockRemove = MockRemoveWatchlistTvSeriesUseCase();
    cubit = TvSeriesDetailCubit(
      getTvSeriesDetail: mockGetDetail,
      getTvSeriesRecommendations: mockGetRecs,
      getWatchlistStatus: mockGetStatus,
      saveWatchlist: mockSave,
      removeWatchlist: mockRemove,
    );
  });

  Widget makeTestable(Widget body) => BlocProvider<TvSeriesDetailCubit>.value(
        value: cubit,
        child: MaterialApp(home: body),
      );

  const tId = 1;
  final tDetail = testTvSeriesDetail;
  final tRecs = <TvSeries>[];

  void mockAllLoaded({bool isInWatchlist = false}) {
    when(mockGetDetail.execute(tId)).thenAnswer((_) async => Right(tDetail));
    when(mockGetRecs.execute(tId)).thenAnswer((_) async => Right(tRecs));
    when(mockGetStatus.execute(tId)).thenAnswer((_) async => isInWatchlist);
  }

  testWidgets('shows progress bar when loading', (tester) async {
    mockAllLoaded();

    cubit.fetchTvSeriesDetail(tId);
    await tester.pumpWidget(makeTestable(const TvSeriesDetailPage(id: tId)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows DetailContent when loaded', (tester) async {
    mockAllLoaded();

    cubit.fetchTvSeriesDetail(tId);
    await tester.pumpWidget(makeTestable(const TvSeriesDetailPage(id: tId)));

    expect(find.byType(DetailContent), findsOneWidget);
  });

  testWidgets('Watchlist button shows add icon when not in watchlist',
      (tester) async {
    when(mockGetDetail.execute(tId)).thenAnswer((_) async => Right(tDetail));
    when(mockGetRecs.execute(tId)).thenAnswer((_) async => const Right([]));
    when(mockGetStatus.execute(tId)).thenAnswer((_) async => false);

    cubit.fetchTvSeriesDetail(tId);
    cubit.loadWatchlistStatus(tId);
    await tester.pumpWidget(makeTestable(const TvSeriesDetailPage(id: tId)));

    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Watchlist button shows check icon when in watchlist',
      (tester) async {
    when(mockGetDetail.execute(tId)).thenAnswer((_) async => Right(tDetail));
    when(mockGetRecs.execute(tId)).thenAnswer((_) async => const Right([]));
    when(mockGetStatus.execute(tId)).thenAnswer((_) async => true);

    cubit.fetchTvSeriesDetail(tId);
    cubit.loadWatchlistStatus(tId);
    await tester.pumpWidget(makeTestable(const TvSeriesDetailPage(id: tId)));

    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  group('Watchlist actions', () {
    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'emits new state with message when add watchlist success',
      build: () {
        when(mockGetDetail.execute(tId)).thenAnswer((_) async => Right(tDetail));
        when(mockGetRecs.execute(tId)).thenAnswer((_) async => const Right([]));
        when(mockGetStatus.execute(tId)).thenAnswer((_) async => false);
        when(mockGetStatus.execute(tDetail.id)).thenAnswer((_) async => false);
        when(mockSave.execute(tDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        return cubit;
      },
      act: (c) async {
        await c.fetchTvSeriesDetail(tId);
        await c.addWatchlist(tDetail);
      },
      expect: () => [
        const TvSeriesDetailState.loading(),
        TvSeriesDetailState.loaded(
          tvSeries: tDetail,
          tvSeriesRecommendations: tRecs,
          isAddedToWatchlist: false,
          watchlistMessage: '',
        ),
        TvSeriesDetailState.loaded(
          tvSeries: tDetail,
          tvSeriesRecommendations: tRecs,
          isAddedToWatchlist: false,
          watchlistMessage: TvSeriesDetailCubit.watchlistAddSuccessMessage,
        ),
      ],
    );
  });
}
