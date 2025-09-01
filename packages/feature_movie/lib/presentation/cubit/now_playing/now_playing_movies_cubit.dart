import 'package:feature_movie/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesCubit({required this.getNowPlayingMovies})
    : super(const NowPlayingMoviesState.initial());

  Future<void> fetchNowPlayingMovies() async {
    emit(const NowPlayingMoviesState.loading());

    final result = await getNowPlayingMovies.execute();

    result.fold(
      (failure) => emit(NowPlayingMoviesState.error(message: failure.message)),
      (movies) => emit(NowPlayingMoviesState.loaded(movies: movies)),
    );
  }
}
