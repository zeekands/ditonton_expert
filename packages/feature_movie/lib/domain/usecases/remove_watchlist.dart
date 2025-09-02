import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class RemoveWatchlist {
  Future<Either<Failure, String>> execute(MovieDetail movie);
}

class RemoveWatchlistImpl implements RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlistImpl(this.repository);

  @override
  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
