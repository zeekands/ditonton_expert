import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetWatchlistMovies {
  Future<Either<Failure, List<Movie>>> execute();
}

class GetWatchlistMoviesImpl implements GetWatchlistMovies {
  final MovieRepository repository;

  GetWatchlistMoviesImpl(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getWatchlistMovies();
  }
}
