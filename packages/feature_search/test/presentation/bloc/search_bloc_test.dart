import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/usecases/search_movie.dart';
import 'package:feature_search/presentation/bloc/search_bloc.dart';
import 'package:feature_search/presentation/bloc/search_event.dart';
import 'package:feature_search/presentation/bloc/search_state.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchMovieUseCase, SearchTvSeriesUseCase])
void main() {
  late SearchBloc bloc;
  late MockSearchMovieUseCase mockMovie;
  late MockSearchTvSeriesUseCase mockTv;

  setUp(() {
    mockMovie = MockSearchMovieUseCase();
    mockTv = MockSearchTvSeriesUseCase();
    bloc = SearchBloc(searchMovies: mockMovie, searchTvSeries: mockTv);
  });

  final tQuery = 'spider';
  final tMovie = Movie.watchlist(id: 1, overview: 'o', posterPath: 'p', title: 't');
  final tTv = TvSeries.watchlist(id: 2, name: 'tv', posterPath: 'pp', overview: 'ov');

  test('initial state is initial', () {
    expect(bloc.state, const SearchState.initial());
  });

  blocTest<SearchBloc, SearchState>(
    'emits [Loading, Loaded] when both succeed',
    build: () {
      when(mockMovie.execute(tQuery)).thenAnswer((_) async => Right(<Movie>[tMovie]));
      when(mockTv.execute(tQuery)).thenAnswer((_) async => Right(<TvSeries>[tTv]));
      return bloc;
    },
    act: (b) => b.add(SearchEvent.onQueryChanged(query: tQuery)),
    wait: const Duration(milliseconds: 600),
    expect: () => [
      const SearchState.loading(),
      isA<SearchLoaded>(),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'emits [Loading, Error] when movie fails',
    build: () {
      when(mockMovie.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('err')));
      when(mockTv.execute(tQuery)).thenAnswer((_) async => Right(<TvSeries>[tTv]));
      return bloc;
    },
    act: (b) => b.add(SearchEvent.onQueryChanged(query: tQuery)),
    wait: const Duration(milliseconds: 600),
    expect: () => [
      const SearchState.loading(),
      const SearchState.error(message: 'Failed to fetch movies'),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'emits [Loading, Error] when tv fails',
    build: () {
      when(mockMovie.execute(tQuery)).thenAnswer((_) async => Right(<Movie>[tMovie]));
      when(mockTv.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('err')));
      return bloc;
    },
    act: (b) => b.add(SearchEvent.onQueryChanged(query: tQuery)),
    wait: const Duration(milliseconds: 600),
    expect: () => [
      const SearchState.loading(),
      const SearchState.error(message: 'Failed to fetch TV series'),
    ],
  );
}
