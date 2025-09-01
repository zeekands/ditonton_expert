import 'package:feature_movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'now_playing_movies_state.freezed.dart';

@freezed
class NowPlayingMoviesState with _$NowPlayingMoviesState {
  const factory NowPlayingMoviesState.initial() = NowPlayingMoviesInitial;
  const factory NowPlayingMoviesState.loading() = NowPlayingMoviesLoading;
  const factory NowPlayingMoviesState.loaded({required List<Movie> movies}) =
      NowPlayingMoviesLoaded;
  const factory NowPlayingMoviesState.error({required String message}) =
      NowPlayingMoviesError;
}
