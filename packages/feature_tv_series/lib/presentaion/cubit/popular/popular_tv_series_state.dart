import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_tv_series_state.freezed.dart';

@freezed
class PopularTvSeriesState with _$PopularTvSeriesState {
  const factory PopularTvSeriesState.initial() = PopularTvSeriesInitial;
  const factory PopularTvSeriesState.loading() = PopularTvSeriesLoading;
  const factory PopularTvSeriesState.loaded({
    required List<TvSeries> tvSeries,
  }) = PopularTvSeriesLoaded;
  const factory PopularTvSeriesState.error({required String message}) =
      PopularTvSeriesError;
}
