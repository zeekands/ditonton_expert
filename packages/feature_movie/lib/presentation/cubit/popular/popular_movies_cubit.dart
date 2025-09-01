import 'package:feature_movie/domain/usecases/get_popular_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesCubit({required this.getPopularMovies})
    : super(const PopularMoviesState.initial());

  Future<void> fetchPopularMovies() async {
    emit(const PopularMoviesState.loading());

    final result = await getPopularMovies.execute();

    result.fold(
      (failure) => emit(PopularMoviesState.error(message: failure.message)),
      (movies) => emit(PopularMoviesState.loaded(movies: movies)),
    );
  }
}
