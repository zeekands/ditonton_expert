import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/usecases/get_popular_movies.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_movies_cubit_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late PopularMoviesCubit cubit;
  late MockGetPopularMovies mockGetPopular;

  setUp(() {
    mockGetPopular = MockGetPopularMovies();
    cubit = PopularMoviesCubit(getPopularMovies: mockGetPopular);
  });

  test('initial state should be initial', () {
    expect(cubit.state, const PopularMoviesState.initial());
  });

  blocTest<PopularMoviesCubit, PopularMoviesState>(
    'emits [Loading, Loaded] on success',
    build: () {
      when(mockGetPopular.execute()).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (c) => c.fetchPopularMovies(),
    expect: () => [
      const PopularMoviesState.loading(),
      PopularMoviesState.loaded(movies: testMovieList),
    ],
  );

  blocTest<PopularMoviesCubit, PopularMoviesState>(
    'emits [Loading, Error] on failure',
    build: () {
      when(mockGetPopular.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (c) => c.fetchPopularMovies(),
    expect: () => [
      const PopularMoviesState.loading(),
      const PopularMoviesState.error(message: 'Server Failure'),
    ],
  );
}

