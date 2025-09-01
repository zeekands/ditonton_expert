import 'package:feature_movie/domain/repositories/movie_repository.dart';

abstract class GetWatchlistStatus {
  Future<bool> execute(int id);
}

class GetWatchlistStatusImpl implements GetWatchlistStatus {
  final MovieRepository repository;

  GetWatchlistStatusImpl(this.repository);

  @override
  Future<bool> execute(int id) {
    return repository.isAddedToWatchlist(id);
  }
}
