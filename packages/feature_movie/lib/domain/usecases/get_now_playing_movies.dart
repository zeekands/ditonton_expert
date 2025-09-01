import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetNowPlayingMovies {
  Future<Either<Failure, List<Movie>>> execute();
}

class GetNowPlayingMoviesImpl extends GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMoviesImpl(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
