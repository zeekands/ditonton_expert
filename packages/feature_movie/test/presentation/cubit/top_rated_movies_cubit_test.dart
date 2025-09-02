import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:core/domain/usecases/no_params.dart';
import 'package:feature_movie/domain/usecases/get_top_rated_movies.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMoviesCubit cubit;
  late MockGetTopRatedMovies mockGetTopRatedMoviesUseCase;

  setUp(() {
    mockGetTopRatedMoviesUseCase = MockGetTopRatedMovies();
    cubit = TopRatedMoviesCubit(
      getTopRatedMovies: mockGetTopRatedMoviesUseCase,
    );
  });

  test('initial state should be initial', () {
    expect(cubit.state, const TopRatedMoviesState.initial());
  });

  blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
    'should emit [Loading, Loaded] when data is fetched successfully',
    build: () {
      when(
        mockGetTopRatedMoviesUseCase.execute(),
      ).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchTopRatedMovies(),
    expect: () => [
      const TopRatedMoviesState.loading(),
      TopRatedMoviesState.loaded(movies: testMovieList),
    ],
  );

  blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
    'should emit [Loading, Error] when data fetch fails',
    build: () {
      when(
        mockGetTopRatedMoviesUseCase.execute(),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchTopRatedMovies(),
    expect: () => [
      const TopRatedMoviesState.loading(),
      const TopRatedMoviesState.error(message: 'Server Failure'),
    ],
  );
}
