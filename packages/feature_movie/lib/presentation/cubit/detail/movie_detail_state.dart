
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';

part 'movie_detail_state.freezed.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = MovieDetailInitial;
  const factory MovieDetailState.loading() = MovieDetailLoading;
  const factory MovieDetailState.loaded({
    required MovieDetail movieDetail,
    required List<Movie> movieRecommendations,
    @Default(false) bool isAddedToWatchlist,
    @Default('') String watchlistMessage,
  }) = MovieDetailLoaded;
  const factory MovieDetailState.error({required String message}) =
      MovieDetailError;
}
