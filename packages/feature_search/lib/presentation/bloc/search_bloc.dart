import 'package:feature_movie/domain/usecases/search_movie.dart';
import 'package:feature_search/helpers/debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/common/content.dart';
import 'package:feature_tv_series/domain/usecases/search_tv_series.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovieUseCase searchMovies;
  final SearchTvSeriesUseCase searchTvSeries;

  SearchBloc({required this.searchMovies, required this.searchTvSeries})
    : super(const SearchState.initial()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      if (query.isEmpty) {
        emit(const SearchState.initial());
        return;
      }

      emit(const SearchState.loading());
      final movieResult = searchMovies.execute(query);
      final tvSeriesResult = searchTvSeries.execute(query);

      final results = await Future.wait([movieResult, tvSeriesResult]);

      results.first.fold(
        (failure) {
          emit(SearchState.error(message: 'Failed to fetch movies'));
        },
        (movies) {
          results.last.fold(
            (failure) {
              emit(SearchState.error(message: 'Failed to fetch TV series'));
            },
            (tvSeries) {
              final List<Content> combinedResults = [
                ...movies as List<Content>,
                ...tvSeries as List<Content>,
              ];
              emit(SearchState.loaded(results: combinedResults));
            },
          );
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
