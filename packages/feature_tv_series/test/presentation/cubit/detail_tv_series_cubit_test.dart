import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'detail_tv_series_cubit_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetailUseCase,
  GetTvSeriesRecommendationsUseCase,
  GetWatchlistStatusTvSeriesUseCase,
  SaveWatchlistTvSeriesUseCase,
  RemoveWatchlistTvSeriesUseCase,
])
void main() {
  late MockGetTvSeriesDetailUseCase mockGetDetail;
  late MockGetTvSeriesRecommendationsUseCase mockGetRecs;
  late MockGetWatchlistStatusTvSeriesUseCase mockGetStatus;
  late MockSaveWatchlistTvSeriesUseCase mockSaveWatchlist;
  late MockRemoveWatchlistTvSeriesUseCase mockRemoveWatchlist;
  late TvSeriesDetailCubit cubit;

  setUp(() {
    mockGetDetail = MockGetTvSeriesDetailUseCase();
    mockGetRecs = MockGetTvSeriesRecommendationsUseCase();
    mockGetStatus = MockGetWatchlistStatusTvSeriesUseCase();
    mockSaveWatchlist = MockSaveWatchlistTvSeriesUseCase();
    mockRemoveWatchlist = MockRemoveWatchlistTvSeriesUseCase();

    cubit = TvSeriesDetailCubit(
      getTvSeriesDetail: mockGetDetail,
      getTvSeriesRecommendations: mockGetRecs,
      getWatchlistStatus: mockGetStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;
  final TvSeriesDetail tDetail = testTvSeriesDetail;
  final List<TvSeries> tRecs = [];

  void mockAllLoaded({bool isInWatchlist = false}) {
    when(mockGetDetail.execute(tId)).thenAnswer((_) async => Right(tDetail));
    when(mockGetRecs.execute(tId)).thenAnswer((_) async => Right(tRecs));
    when(mockGetStatus.execute(tId)).thenAnswer((_) async => isInWatchlist);
  }

  test('initial state should be initial', () {
    expect(cubit.state, const TvSeriesDetailState.initial());
  });

  blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
    'emits [Loading, Loaded] when fetch succeeds',
    build: () {
      mockAllLoaded();
      return cubit;
    },
    act: (c) => c.fetchTvSeriesDetail(tId),
    expect: () => [
      const TvSeriesDetailState.loading(),
      TvSeriesDetailState.loaded(
        tvSeries: tDetail,
        tvSeriesRecommendations: tRecs,
        isAddedToWatchlist: false,
        watchlistMessage: '',
      ),
    ],
  );

  blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
    'emits [Loading, Error] when detail fails',
    build: () {
      when(mockGetDetail.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('err')));
      when(mockGetRecs.execute(tId)).thenAnswer((_) async => const Right([]));
      when(mockGetStatus.execute(tId)).thenAnswer((_) async => false);
      return cubit;
    },
    act: (c) => c.fetchTvSeriesDetail(tId),
    expect: () => [
      const TvSeriesDetailState.loading(),
      const TvSeriesDetailState.error(message: 'err'),
    ],
  );

  blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
    'updates message and status when add to watchlist success',
    build: () {
      mockAllLoaded();
      when(mockSaveWatchlist.execute(tDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetStatus.execute(tDetail.id)).thenAnswer((_) async => false);
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
}
