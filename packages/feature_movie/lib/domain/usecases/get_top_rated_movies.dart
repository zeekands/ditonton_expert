import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetTopRatedMovies {
  Future<Either<Failure, List<Movie>>> execute();
}

class GetTopRatedMoviesImpl extends GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMoviesImpl(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
