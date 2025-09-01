import 'package:feature_movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_movies_state.freezed.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.initial() = TopRatedMoviesInitial;
  const factory TopRatedMoviesState.loading() = TopRatedMoviesLoading;
  const factory TopRatedMoviesState.loaded({required List<Movie> movies}) =
      TopRatedMoviesLoaded;
  const factory TopRatedMoviesState.error({required String message}) =
      TopRatedMoviesError;
}
