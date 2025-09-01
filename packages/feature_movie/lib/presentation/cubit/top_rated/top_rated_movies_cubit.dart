import 'package:feature_movie/domain/usecases/get_top_rated_movies.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMoviesCubit({required this.getTopRatedMovies})
    : super(const TopRatedMoviesState.initial());

  Future<void> fetchTopRatedMovies() async {
    emit(const TopRatedMoviesState.loading());

    final result = await getTopRatedMovies.execute();

    result.fold(
      (failure) => emit(TopRatedMoviesState.error(message: failure.message)),
      (movies) => emit(TopRatedMoviesState.loaded(movies: movies)),
    );
  }
}
