import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class SaveWatchlist {
  Future<Either<Failure, String>> execute(MovieDetail movie);
}

class SaveWatchlistImpl implements SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlistImpl(this.repository);

  @override
  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
