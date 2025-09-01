import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetMovieRecommendations {
  Future<Either<Failure, List<Movie>>> execute(int id);
}

class GetMovieRecommendationsImpl implements GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendationsImpl(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute(int id) {
    return repository.getMovieRecommendations(id);
  }
}
