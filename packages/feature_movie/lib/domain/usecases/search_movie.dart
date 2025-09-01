import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class SearchMovieUseCase {
  Future<Either<Failure, List<Movie>>> execute(String query);
}

class SearchMovie implements SearchMovieUseCase {
  final MovieRepository repository;
  SearchMovie(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchMovies(query);
  }
}
