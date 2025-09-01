import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'now_playing_tv_series_state.freezed.dart';

@freezed
class NowPlayingTvSeriesState with _$NowPlayingTvSeriesState {
  const factory NowPlayingTvSeriesState.initial() = NowPlayingTvSeriesInitial;
  const factory NowPlayingTvSeriesState.loading() = NowPlayingTvSeriesLoading;
  const factory NowPlayingTvSeriesState.loaded({
    required List<TvSeries> tvSeries,
  }) = NowPlayingTvSeriesLoaded;
  const factory NowPlayingTvSeriesState.error({required String message}) =
      NowPlayingTvSeriesError;
}
