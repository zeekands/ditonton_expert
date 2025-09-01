import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_tv_series_state.freezed.dart';

@freezed
class TvSeriesDetailState with _$TvSeriesDetailState {
  const factory TvSeriesDetailState.initial() = TvSeriesDetailInitial;
  const factory TvSeriesDetailState.loading() = TvSeriesDetailLoading;
    const factory TvSeriesDetailState.loaded({
    required TvSeriesDetail tvSeries,
    required List<TvSeries> tvSeriesRecommendations,
    @Default(false) bool isAddedToWatchlist,
    @Default('') String watchlistMessage,
  }) = TvSeriesDetailLoaded;
  const factory TvSeriesDetailState.error({required String message}) =
      TvSeriesDetailError;
}
