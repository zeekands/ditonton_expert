import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTvSeriesUseCase])
void main() {
  late PopularTvSeriesCubit cubit;
  late MockGetPopularTvSeriesUseCase mockGetPopular;

  setUp(() {
    mockGetPopular = MockGetPopularTvSeriesUseCase();
    cubit = PopularTvSeriesCubit(getPopular: mockGetPopular);
  });

  test('initial state should be initial', () {
    expect(cubit.state, const PopularTvSeriesState.initial());
  });

  blocTest<PopularTvSeriesCubit, PopularTvSeriesState>(
    'emits [Loading, Loaded] on success',
    build: () {
      when(mockGetPopular.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (c) => c.fetchPopularTvSeries(),
    expect: () => [
      const PopularTvSeriesState.loading(),
      PopularTvSeriesState.loaded(tvSeries: testTvSeriesList),
    ],
  );

  blocTest<PopularTvSeriesCubit, PopularTvSeriesState>(
    'emits [Loading, Error] on failure',
    build: () {
      when(mockGetPopular.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (c) => c.fetchPopularTvSeries(),
    expect: () => [
      const PopularTvSeriesState.loading(),
      const PopularTvSeriesState.error(message: 'Server Failure'),
    ],
  );
}

