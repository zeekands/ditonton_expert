import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetMovieDetail {
  Future<Either<Failure, MovieDetail>> execute(int id);
}

class GetMovieDetailImpl implements GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetailImpl(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
