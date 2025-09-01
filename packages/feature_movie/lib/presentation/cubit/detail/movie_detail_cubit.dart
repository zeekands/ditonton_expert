// lib/features/movie_feature/presentation/cubit/movie_detail/movie_detail_cubit.dart

import 'package:feature_movie/domain/usecases/get_watchlist_status.dart';
import 'package:feature_movie/domain/usecases/remove_watchlist.dart';
import 'package:feature_movie/domain/usecases/save_watchlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:feature_movie/domain/usecases/get_movie_detail.dart';
import 'package:feature_movie/domain/usecases/get_movie_recommendations.dart';
import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchlistStatus getWatchlistStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchlistStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(const MovieDetailState.initial());

  Future<void> fetchMovieDetail(int id) async {
    emit(const MovieDetailState.loading());
    final detailResult = await getMovieDetail.execute(id);
    final recommendationsResult = await getMovieRecommendations.execute(id);
    final isAddedToWatchlist = await getWatchlistStatus.execute(id);

    detailResult.fold(
      (failure) => emit(MovieDetailState.error(message: failure.message)),
      (movie) {
        recommendationsResult.fold(
          (failure) => emit(MovieDetailState.error(message: failure.message)),
          (recommendations) => emit(
            MovieDetailState.loaded(
              movieDetail: movie,
              movieRecommendations: recommendations,
              isAddedToWatchlist: isAddedToWatchlist,
            ),
          ),
        );
      },
    );
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchlistStatus.execute(id);
    if (state is MovieDetailLoaded) {
      final currentState = state as MovieDetailLoaded;
      emit(
        currentState.copyWith(isAddedToWatchlist: result, watchlistMessage: ''),
      );
    }
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);
    final isAdded = await getWatchlistStatus.execute(movie.id);

    result.fold(
      (failure) {
        if (state is MovieDetailLoaded) {
          final currentState = state as MovieDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: failure.message,
            ),
          );
        }
      },
      (successMessage) {
        if (state is MovieDetailLoaded) {
          final currentState = state as MovieDetailLoaded;
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

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);
    final isAdded = await getWatchlistStatus.execute(movie.id);

    result.fold(
      (failure) {
        if (state is MovieDetailLoaded) {
          final currentState = state as MovieDetailLoaded;
          emit(
            currentState.copyWith(
              isAddedToWatchlist: isAdded,
              watchlistMessage: failure.message,
            ),
          );
        }
      },
      (successMessage) {
        if (state is MovieDetailLoaded) {
          final currentState = state as MovieDetailLoaded;
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
}
