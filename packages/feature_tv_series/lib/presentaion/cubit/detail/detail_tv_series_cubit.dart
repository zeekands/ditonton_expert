import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailCubit extends Cubit<TvSeriesDetailState> {
  final GetTvSeriesDetailUseCase getTvSeriesDetail;
  final GetTvSeriesRecommendationsUseCase getTvSeriesRecommendations;
  final GetWatchlistStatusTvSeriesUseCase getWatchlistStatus;
  final SaveWatchlistTvSeriesUseCase saveWatchlist;
  final RemoveWatchlistTvSeriesUseCase removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  TvSeriesDetailCubit({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getWatchlistStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(const TvSeriesDetailState.initial());

  final String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  final bool _isAddedToWatchlist = false;
  bool get isAddedToWatchlist => _isAddedToWatchlist;

  Future<void> fetchTvSeriesDetail(int id) async {
    emit(const TvSeriesDetailState.loading());
    final detailResult = await getTvSeriesDetail.execute(id);
    final recommendationsResult = await getTvSeriesRecommendations.execute(id);
    final isAddedToWatchlist = await getWatchlistStatus.execute(id);

    detailResult.fold(
      (failure) => emit(TvSeriesDetailState.error(message: failure.message)),
      (tvSeries) {
        recommendationsResult.fold(
          (failure) =>
              emit(TvSeriesDetailState.error(message: failure.message)),
          (recommendations) => emit(
            TvSeriesDetailState.loaded(
              tvSeries: tvSeries,
              tvSeriesRecommendations: recommendations,
              isAddedToWatchlist: isAddedToWatchlist,
            ),
          ),
        );
      },
    );
  }

  Future<void> addWatchlist(TvSeriesDetail tvSeries) async {
    final result = await saveWatchlist.execute(tvSeries);
    final isAdded = await getWatchlistStatus.execute(tvSeries.id);

    result.fold(
      (failure) {
        if (state is TvSeriesDetailLoaded) {
          final currentState = state as TvSeriesDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: failure.message,
            ),
          );
        }
      },
      (successMessage) {
        if (state is TvSeriesDetailLoaded) {
          final currentState = state as TvSeriesDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: successMessage,
            ),
          );
        }
      },
    );
  }

  Future<void> removeFromWatchlist(TvSeriesDetail tvSeries) async {
    final result = await removeWatchlist.execute(tvSeries);
    final isAdded = await getWatchlistStatus.execute(tvSeries.id);

    result.fold(
      (failure) {
        if (state is TvSeriesDetailLoaded) {
          final currentState = state as TvSeriesDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: failure.message,
            ),
          );
        }
      },
      (successMessage) {
        if (state is TvSeriesDetailLoaded) {
          final currentState = state as TvSeriesDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: successMessage,
            ),
          );
        }
      },
    );
  }

  Future<void> loadWatchlistStatus(int id) async {
    final isAdded = await getWatchlistStatus.execute(id);
    state.when(
      initial: () {},
      loading: () {},
      loaded: (tvSeries, recommendations, isAddedToWatchlist, message) {
        emit(
          TvSeriesDetailState.loaded(
            tvSeries: tvSeries,
            tvSeriesRecommendations: recommendations,
            isAddedToWatchlist: isAdded,
            watchlistMessage: message,
          ),
        );
      },
      error: (message) {
        emit(TvSeriesDetailState.error(message: message));
      },
    );
  }
}
