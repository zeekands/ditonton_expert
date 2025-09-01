import 'package:core/common/content.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_movies.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchlistTvSeriesUseCase getWatchlistTvSeries;

  WatchlistCubit({
    required this.getWatchlistMovies,
    required this.getWatchlistTvSeries,
  }) : super(const WatchlistState.initial());

  Future<void> fetchWatchlist() async {
    emit(const WatchlistState.loading());

    final movieResult = getWatchlistMovies.execute();
    final tvSeriesResult = getWatchlistTvSeries.execute();

    final results = await Future.wait([movieResult, tvSeriesResult]);

    results.first.fold(
      (failure) {
        emit(WatchlistState.error(message: failure.message));
      },
      (movies) {
        results.last.fold(
          (failure) {
            emit(WatchlistState.error(message: failure.message));
          },
          (tvSeries) {
            final List<Content> combinedWatchlist = [
              ...movies as List<Content>,
              ...tvSeries as List<Content>,
            ];
            emit(WatchlistState.loaded(watchlist: combinedWatchlist));
          },
        );
      },
    );
  }
}
