import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class GetTvSeriesRecommendationsUseCase {
  Future<Either<Failure, List<TvSeries>>> execute(int id);
}

class GetTvSeriesRecommendations implements GetTvSeriesRecommendationsUseCase {
  final TvSeriesRepository repository;
  GetTvSeriesRecommendations(this.repository);

  @override
  Future<Either<Failure, List<TvSeries>>> execute(int id) {
    return repository.getTvSeriesRecommendations(id);
  }
}
