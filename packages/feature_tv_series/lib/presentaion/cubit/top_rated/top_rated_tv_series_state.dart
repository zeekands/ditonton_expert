import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_tv_series_state.freezed.dart';

@freezed
class TopRatedTvSeriesState with _$TopRatedTvSeriesState {
  const factory TopRatedTvSeriesState.initial() = TopRatedTvSeriesInitial;
  const factory TopRatedTvSeriesState.loading() = TopRatedTvSeriesLoading;
  const factory TopRatedTvSeriesState.loaded({
    required List<TvSeries> tvSeries,
  }) = TopRatedTvSeriesLoaded;
  const factory TopRatedTvSeriesState.error({required String message}) =
      TopRatedTvSeriesError;
}
