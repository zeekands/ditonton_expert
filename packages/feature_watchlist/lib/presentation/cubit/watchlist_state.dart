import 'package:core/common/content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.freezed.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = WatchlistInitial;
  const factory WatchlistState.loading() = WatchlistLoading;
  const factory WatchlistState.loaded({required List<Content> watchlist}) =
      WatchlistLoaded;
  const factory WatchlistState.error({required String message}) =
      WatchlistError;
}
