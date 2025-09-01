
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class GetWatchlistStatusTvSeriesUseCase {
  Future<bool> execute(int id);
}

class GetWatchlistStatusTvSeries implements GetWatchlistStatusTvSeriesUseCase {
  final TvSeriesRepository repository;
  GetWatchlistStatusTvSeries(this.repository);

  @override
  Future<bool> execute(int id) {
    return repository.isAddedToWatchlistTvSeries(id);
  }
}
