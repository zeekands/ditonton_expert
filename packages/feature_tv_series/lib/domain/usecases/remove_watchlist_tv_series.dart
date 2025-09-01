import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class RemoveWatchlistTvSeriesUseCase {
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries);
}

class RemoveWatchlistTvSeries implements RemoveWatchlistTvSeriesUseCase {
  final TvSeriesRepository repository;
  RemoveWatchlistTvSeries(this.repository);

  @override
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.removeWatchlistTvSeries(tvSeries);
  }
}
