import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'now_playing_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeriesUseCase])
void main() {
  late NowPlayingTvSeriesCubit cubit;
  late MockGetNowPlayingTvSeriesUseCase mockGetNowPlaying;

  setUp(() {
    mockGetNowPlaying = MockGetNowPlayingTvSeriesUseCase();
    cubit = NowPlayingTvSeriesCubit(getNowPlaying: mockGetNowPlaying);
  });

  test('initial state should be initial', () {
    expect(cubit.state, const NowPlayingTvSeriesState.initial());
  });

  blocTest<NowPlayingTvSeriesCubit, NowPlayingTvSeriesState>(
    'emits [Loading, Loaded] on success',
    build: () {
      when(mockGetNowPlaying.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (c) => c.fetchNowPlayingTvSeries(),
    expect: () => [
      const NowPlayingTvSeriesState.loading(),
      NowPlayingTvSeriesState.loaded(tvSeries: testTvSeriesList),
    ],
  );

  blocTest<NowPlayingTvSeriesCubit, NowPlayingTvSeriesState>(
    'emits [Loading, Error] on failure',
    build: () {
      when(mockGetNowPlaying.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (c) => c.fetchNowPlayingTvSeries(),
    expect: () => [
      const NowPlayingTvSeriesState.loading(),
      const NowPlayingTvSeriesState.error(message: 'Server Failure'),
    ],
  );
}
