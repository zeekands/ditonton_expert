import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetPopularMovies {
  Future<Either<Failure, List<Movie>>> execute();
}

class GetPopularMoviesImpl implements GetPopularMovies {
  final MovieRepository repository;

  GetPopularMoviesImpl(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
