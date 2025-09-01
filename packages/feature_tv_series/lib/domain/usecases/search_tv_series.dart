import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class SearchTvSeriesUseCase {
  Future<Either<Failure, List<TvSeries>>> execute(String query);
}

class SearchTvSeries implements SearchTvSeriesUseCase {
  final TvSeriesRepository repository;
  SearchTvSeries(this.repository);

  @override
  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
