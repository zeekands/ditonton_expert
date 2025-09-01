// lib/features/search_feature/presentation/bloc/search_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/common/content.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitial;
  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.loaded({required List<Content> results}) =
      SearchLoaded;
  const factory SearchState.error({required String message}) = SearchError;
}
