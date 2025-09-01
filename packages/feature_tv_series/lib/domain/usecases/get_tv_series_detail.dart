import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';

abstract class GetTvSeriesDetailUseCase {
  Future<Either<Failure, TvSeriesDetail>> execute(int id);
}

class GetTvSeriesDetail implements GetTvSeriesDetailUseCase {
  final TvSeriesRepository repository;
  GetTvSeriesDetail(this.repository);

  @override
  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
