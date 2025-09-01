import 'package:feature_movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies_state.freezed.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial() = PopularMoviesInitial;
  const factory PopularMoviesState.loading() = PopularMoviesLoading;
  const factory PopularMoviesState.loaded({required List<Movie> movies}) =
      PopularMoviesLoaded;
  const factory PopularMoviesState.error({required String message}) =
      PopularMoviesError;
}
