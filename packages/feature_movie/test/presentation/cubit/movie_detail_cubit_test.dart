import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:core/domain/usecases/no_params.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:feature_movie/domain/usecases/get_movie_detail.dart';
import 'package:feature_movie/domain/usecases/get_movie_recommendations.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_status.dart';
import 'package:feature_movie/domain/usecases/remove_watchlist.dart';
import 'package:feature_movie/domain/usecases/save_watchlist.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_cubit.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchlistStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailCubit cubit;
  late MockGetMovieDetail mockGetMovieDetailUseCase;
  late MockGetMovieRecommendations mockGetMovieRecommendationsUseCase;
  late MockGetWatchlistStatus mockGetWatchlistStatusUseCase;
  late MockSaveWatchlist mockSaveWatchlistUseCase;
  late MockRemoveWatchlist mockRemoveWatchlistUseCase;

  setUp(() {
    mockGetMovieDetailUseCase = MockGetMovieDetail();
    mockGetMovieRecommendationsUseCase = MockGetMovieRecommendations();
    mockGetWatchlistStatusUseCase = MockGetWatchlistStatus();
    mockSaveWatchlistUseCase = MockSaveWatchlist();
    mockRemoveWatchlistUseCase = MockRemoveWatchlist();

    cubit = MovieDetailCubit(
      getMovieDetail: mockGetMovieDetailUseCase,
      getMovieRecommendations: mockGetMovieRecommendationsUseCase,
      getWatchlistStatus: mockGetWatchlistStatusUseCase,
      saveWatchlist: mockSaveWatchlistUseCase,
      removeWatchlist: mockRemoveWatchlistUseCase,
    );
  });

  final tId = 1;
  final tMovieRecommendations = <Movie>[];
  final tMovieDetail = testMovieDetail;
  final tMovieWatchlist = testWatchlistMovie;

  test('initial state should be initial', () {
    expect(cubit.state, const MovieDetailState.initial());
  });

  group('Get Movie Detail', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'should emit [Loading, Loaded] when fetching detail is successful',
      build: () {
        when(
          mockGetMovieDetailUseCase.execute(tId),
        ).thenAnswer((_) async => Right(tMovieDetail));
        when(
          mockGetMovieRecommendationsUseCase.execute(tId),
        ).thenAnswer((_) async => Right(tMovieRecommendations));
        when(
          mockGetWatchlistStatusUseCase.execute(tId),
        ).thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.fetchMovieDetail(tId),
      expect: () => [
        const MovieDetailState.loading(),
        MovieDetailState.loaded(
          movieDetail: tMovieDetail,
          movieRecommendations: tMovieRecommendations,
          isAddedToWatchlist: false,
          watchlistMessage: '',
        ),
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'should emit [Loading, Error] when fetching detail fails',
      build: () {
        when(
          mockGetMovieDetailUseCase.execute(tId),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(
          mockGetMovieRecommendationsUseCase.execute(tId),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        when(
          mockGetWatchlistStatusUseCase.execute(tId),
        ).thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.fetchMovieDetail(tId),
      expect: () => [
        const MovieDetailState.loading(),
        const MovieDetailState.error(message: 'Server Failure'),
      ],
    );
  });

  group('Watchlist Actions', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'should emit new state with message and status when add to watchlist is successful',
      build: () {
        when(
          mockGetMovieDetailUseCase.execute(tId),
        ).thenAnswer((_) async => Right(tMovieDetail));
        when(
          mockGetMovieRecommendationsUseCase.execute(tId),
        ).thenAnswer((_) async => Right(tMovieRecommendations));
        when(mockSaveWatchlistUseCase.execute(tMovieDetail)).thenAnswer(
          (_) async => const Right(MovieDetailCubit.watchlistAddSuccessMessage),
        );
        when(
          mockGetWatchlistStatusUseCase.execute(tId),
        ).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) async {
        await cubit.fetchMovieDetail(tId);
        await cubit.addWatchlist(tMovieDetail);
      },
      expect: () => [
        const MovieDetailState.loading(),
        MovieDetailState.loaded(
          movieDetail: tMovieDetail,
          movieRecommendations: tMovieRecommendations,
          isAddedToWatchlist: true,
          watchlistMessage: '',
        ),
        MovieDetailState.loaded(
          movieDetail: tMovieDetail,
          movieRecommendations: tMovieRecommendations,
          isAddedToWatchlist: true,
          watchlistMessage: MovieDetailCubit.watchlistAddSuccessMessage,
        ),
      ],
    );
  });
}
