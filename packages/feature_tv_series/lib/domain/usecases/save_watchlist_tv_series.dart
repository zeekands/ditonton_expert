import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class SaveWatchlistTvSeriesUseCase {
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries);
}

class SaveWatchlistTvSeries implements SaveWatchlistTvSeriesUseCase {
  final TvSeriesRepository repository;
  SaveWatchlistTvSeries(this.repository);

  @override
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.saveWatchlistTvSeries(tvSeries);
  }
}
