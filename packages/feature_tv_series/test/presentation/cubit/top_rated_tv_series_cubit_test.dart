import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeriesUseCase])
void main() {
  late TopRatedTvSeriesCubit cubit;
  late MockGetTopRatedTvSeriesUseCase mockGetTopRated;

  setUp(() {
    mockGetTopRated = MockGetTopRatedTvSeriesUseCase();
    cubit = TopRatedTvSeriesCubit(getTopRatedTvSeries: mockGetTopRated);
  });

  test('initial state should be initial', () {
    expect(cubit.state, const TopRatedTvSeriesState.initial());
  });

  blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
    'emits [Loading, Loaded] on success',
    build: () {
      when(mockGetTopRated.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (c) => c.fetchTopRatedTvSeries(),
    expect: () => [
      const TopRatedTvSeriesState.loading(),
      TopRatedTvSeriesState.loaded(tvSeries: testTvSeriesList),
    ],
  );

  blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
    'emits [Loading, Error] on failure',
    build: () {
      when(mockGetTopRated.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (c) => c.fetchTopRatedTvSeries(),
    expect: () => [
      const TopRatedTvSeriesState.loading(),
      const TopRatedTvSeriesState.error(message: 'Server Failure'),
    ],
  );
}

