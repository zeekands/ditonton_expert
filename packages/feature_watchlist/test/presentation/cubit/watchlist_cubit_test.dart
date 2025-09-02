import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_movies.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'watchlist_cubit_test.mocks.dart';

final _tMovie = Movie.watchlist(id: 1, overview: 'o', posterPath: 'p', title: 't');
final _tTv = TvSeries.watchlist(id: 2, name: 'tv', posterPath: 'pp2', overview: 'ov2');

@GenerateMocks([GetWatchlistMovies, GetWatchlistTvSeriesUseCase])
void main() {
  late WatchlistCubit cubit;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchlistTvSeriesUseCase mockGetWatchlistTvSeries;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeriesUseCase();
    cubit = WatchlistCubit(
      getWatchlistMovies: mockGetWatchlistMovies,
      getWatchlistTvSeries: mockGetWatchlistTvSeries,
    );
  });

  test('initial state should be initial', () {
    expect(cubit.state, const WatchlistState.initial());
  });

  blocTest<WatchlistCubit, WatchlistState>(
    'emits [Loading, Loaded] when both sources succeed',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(<Movie>[_tMovie]));
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Right(<TvSeries>[_tTv]));
      return cubit;
    },
    act: (c) => c.fetchWatchlist(),
    expect: () => [
      const WatchlistState.loading(),
      isA<WatchlistLoaded>(),
    ],
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'emits [Loading, Error] when movie fetch fails',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('err')));
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Right(<TvSeries>[_tTv]));
      return cubit;
    },
    act: (c) => c.fetchWatchlist(),
    expect: () => [
      const WatchlistState.loading(),
      const WatchlistState.error(message: 'err'),
    ],
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'emits [Loading, Error] when tv fetch fails',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(<Movie>[]));
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('err2')));
      return cubit;
    },
    act: (c) => c.fetchWatchlist(),
    expect: () => [
      const WatchlistState.loading(),
      const WatchlistState.error(message: 'err2'),
    ],
  );
}
