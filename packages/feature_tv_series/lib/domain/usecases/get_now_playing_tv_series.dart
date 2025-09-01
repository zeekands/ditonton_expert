import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class GetNowPlayingTvSeriesUseCase {
  Future<Either<Failure, List<TvSeries>>> execute();
}

class GetNowPlayingTvSeries implements GetNowPlayingTvSeriesUseCase {
  final TvSeriesRepository repository;
  GetNowPlayingTvSeries(this.repository);

  @override
  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getNowPlayingTvSeries();
  }
}
