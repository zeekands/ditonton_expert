import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/usecases/get_now_playing_movies.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'now_playing_movies_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingMoviesCubit cubit;
  late GetNowPlayingMovies mockGetNowPlayingMoviesUseCase;

  setUp(() {
    mockGetNowPlayingMoviesUseCase = MockGetNowPlayingMovies();
    cubit = NowPlayingMoviesCubit(
      getNowPlayingMovies: mockGetNowPlayingMoviesUseCase,
    );
  });

  test('initial state should be initial', () {
    expect(cubit.state, const NowPlayingMoviesState.initial());
  });

  blocTest<NowPlayingMoviesCubit, NowPlayingMoviesState>(
    'should emit [Loading, Loaded] when data is fetched successfully',
    build: () {
      when(
        mockGetNowPlayingMoviesUseCase.execute(),
      ).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchNowPlayingMovies(),
    expect: () => [
      const NowPlayingMoviesState.loading(),
      NowPlayingMoviesState.loaded(movies: testMovieList),
    ],
  );

  blocTest<NowPlayingMoviesCubit, NowPlayingMoviesState>(
    'should emit [Loading, Error] when data fetch fails',
    build: () {
      when(
        mockGetNowPlayingMoviesUseCase.execute(),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchNowPlayingMovies(),
    expect: () => [
      const NowPlayingMoviesState.loading(),
      const NowPlayingMoviesState.error(message: 'Server Failure'),
    ],
  );
}
