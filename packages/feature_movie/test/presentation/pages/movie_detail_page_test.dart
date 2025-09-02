// test/features/movie_feature/presentation/pages/movie_detail_page_test.dart

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
import 'package:feature_movie/presentation/pages/detail/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_page_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchlistStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MockGetMovieDetail mockGetMovieDetailUseCase;
  late MockGetMovieRecommendations mockGetMovieRecommendationsUseCase;
  late MockGetWatchlistStatus mockGetWatchlistStatusUseCase;
  late MockSaveWatchlist mockSaveWatchlistUseCase;
  late MockRemoveWatchlist mockRemoveWatchlistUseCase;
  late MovieDetailCubit cubit;

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

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailCubit>.value(
      value: cubit,
      child: MaterialApp(home: body),
    );
  }

  final tId = 1;
  final tMovieRecommendations = <Movie>[];
  final tMovieDetail = testMovieDetail;

  void mockAllLoaded() {
    when(
      mockGetMovieDetailUseCase.execute(tId),
    ).thenAnswer((_) async => Right(tMovieDetail));
    when(
      mockGetMovieRecommendationsUseCase.execute(tId),
    ).thenAnswer((_) async => Right(tMovieRecommendations));
    when(
      mockGetWatchlistStatusUseCase.execute(tId),
    ).thenAnswer((_) async => false);
  }

  testWidgets('Page should display progress bar when loading', (
    WidgetTester tester,
  ) async {
    mockAllLoaded();

    cubit.fetchMovieDetail(tId);
    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: tId)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display loaded content when data is loaded', (
    WidgetTester tester,
  ) async {
    mockAllLoaded();
    cubit.fetchMovieDetail(tId);
    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: tId)));
    expect(find.byType(DetailContent), findsOneWidget);
  });

  testWidgets(
    'Watchlist button should display add icon when not added to watchlist',
    (WidgetTester tester) async {
      when(
        mockGetMovieDetailUseCase.execute(tId),
      ).thenAnswer((_) async => Right(tMovieDetail));
      when(
        mockGetMovieRecommendationsUseCase.execute(tId),
      ).thenAnswer((_) async => const Right([]));
      when(
        mockGetWatchlistStatusUseCase.execute(tId),
      ).thenAnswer((_) async => false);

      cubit.fetchMovieDetail(tId);
      cubit.loadWatchlistStatus(tId);
      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: tId)));

      final watchlistButtonIcon = find.byIcon(Icons.add);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    'Watchlist button should display check icon when added to watchlist',
    (WidgetTester tester) async {
      when(
        mockGetMovieDetailUseCase.execute(tId),
      ).thenAnswer((_) async => Right(tMovieDetail));
      when(
        mockGetMovieRecommendationsUseCase.execute(tId),
      ).thenAnswer((_) async => const Right([]));
      when(
        mockGetWatchlistStatusUseCase.execute(tId),
      ).thenAnswer((_) async => true);

      cubit.fetchMovieDetail(tId);
      cubit.loadWatchlistStatus(tId);
      await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: tId)));

      final watchlistButtonIcon = find.byIcon(Icons.check);
      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  group('Watchlist Actions', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'should emit new state with message and status when add to watchlist is successful',
      build: () {
        when(
          mockGetMovieDetailUseCase.execute(tId),
        ).thenAnswer((_) async => Right(tMovieDetail));
        when(
          mockGetMovieRecommendationsUseCase.execute(tId),
        ).thenAnswer((_) async => const Right([]));
        when(
          mockGetWatchlistStatusUseCase.execute(tId),
        ).thenAnswer((_) async => false);
        when(
          mockSaveWatchlistUseCase.execute(tMovieDetail),
        ).thenAnswer((_) async => const Right('Added to Watchlist'));
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
          isAddedToWatchlist: false,
          watchlistMessage: '',
        ),
        MovieDetailState.loaded(
          movieDetail: tMovieDetail,
          movieRecommendations: tMovieRecommendations,
          isAddedToWatchlist: false,
          watchlistMessage: MovieDetailCubit.watchlistAddSuccessMessage,
        ),
      ],
    );
  });
}
