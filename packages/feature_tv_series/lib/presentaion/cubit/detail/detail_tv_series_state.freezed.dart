// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_tv_series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TvSeriesDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TvSeriesDetailState()';
}


}

/// @nodoc
class $TvSeriesDetailStateCopyWith<$Res>  {
$TvSeriesDetailStateCopyWith(TvSeriesDetailState _, $Res Function(TvSeriesDetailState) __);
}


/// Adds pattern-matching-related methods to [TvSeriesDetailState].
extension TvSeriesDetailStatePatterns on TvSeriesDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TvSeriesDetailInitial value)?  initial,TResult Function( TvSeriesDetailLoading value)?  loading,TResult Function( TvSeriesDetailLoaded value)?  loaded,TResult Function( TvSeriesDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TvSeriesDetailInitial() when initial != null:
return initial(_that);case TvSeriesDetailLoading() when loading != null:
return loading(_that);case TvSeriesDetailLoaded() when loaded != null:
return loaded(_that);case TvSeriesDetailError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TvSeriesDetailInitial value)  initial,required TResult Function( TvSeriesDetailLoading value)  loading,required TResult Function( TvSeriesDetailLoaded value)  loaded,required TResult Function( TvSeriesDetailError value)  error,}){
final _that = this;
switch (_that) {
case TvSeriesDetailInitial():
return initial(_that);case TvSeriesDetailLoading():
return loading(_that);case TvSeriesDetailLoaded():
return loaded(_that);case TvSeriesDetailError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TvSeriesDetailInitial value)?  initial,TResult? Function( TvSeriesDetailLoading value)?  loading,TResult? Function( TvSeriesDetailLoaded value)?  loaded,TResult? Function( TvSeriesDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TvSeriesDetailInitial() when initial != null:
return initial(_that);case TvSeriesDetailLoading() when loading != null:
return loading(_that);case TvSeriesDetailLoaded() when loaded != null:
return loaded(_that);case TvSeriesDetailError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TvSeriesDetail tvSeries,  List<TvSeries> tvSeriesRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TvSeriesDetailInitial() when initial != null:
return initial();case TvSeriesDetailLoading() when loading != null:
return loading();case TvSeriesDetailLoaded() when loaded != null:
return loaded(_that.tvSeries,_that.tvSeriesRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case TvSeriesDetailError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TvSeriesDetail tvSeries,  List<TvSeries> tvSeriesRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TvSeriesDetailInitial():
return initial();case TvSeriesDetailLoading():
return loading();case TvSeriesDetailLoaded():
return loaded(_that.tvSeries,_that.tvSeriesRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case TvSeriesDetailError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TvSeriesDetail tvSeries,  List<TvSeries> tvSeriesRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TvSeriesDetailInitial() when initial != null:
return initial();case TvSeriesDetailLoading() when loading != null:
return loading();case TvSeriesDetailLoaded() when loaded != null:
return loaded(_that.tvSeries,_that.tvSeriesRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case TvSeriesDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TvSeriesDetailInitial implements TvSeriesDetailState {
  const TvSeriesDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TvSeriesDetailState.initial()';
}


}




/// @nodoc


class TvSeriesDetailLoading implements TvSeriesDetailState {
  const TvSeriesDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TvSeriesDetailState.loading()';
}


}




/// @nodoc


class TvSeriesDetailLoaded implements TvSeriesDetailState {
  const TvSeriesDetailLoaded({required this.tvSeries, required final  List<TvSeries> tvSeriesRecommendations, this.isAddedToWatchlist = false, this.watchlistMessage = ''}): _tvSeriesRecommendations = tvSeriesRecommendations;
  

 final  TvSeriesDetail tvSeries;
 final  List<TvSeries> _tvSeriesRecommendations;
 List<TvSeries> get tvSeriesRecommendations {
  if (_tvSeriesRecommendations is EqualUnmodifiableListView) return _tvSeriesRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeriesRecommendations);
}

@JsonKey() final  bool isAddedToWatchlist;
@JsonKey() final  String watchlistMessage;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvSeriesDetailLoadedCopyWith<TvSeriesDetailLoaded> get copyWith => _$TvSeriesDetailLoadedCopyWithImpl<TvSeriesDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailLoaded&&(identical(other.tvSeries, tvSeries) || other.tvSeries == tvSeries)&&const DeepCollectionEquality().equals(other._tvSeriesRecommendations, _tvSeriesRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,tvSeries,const DeepCollectionEquality().hash(_tvSeriesRecommendations),isAddedToWatchlist,watchlistMessage);

@override
String toString() {
  return 'TvSeriesDetailState.loaded(tvSeries: $tvSeries, tvSeriesRecommendations: $tvSeriesRecommendations, isAddedToWatchlist: $isAddedToWatchlist, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class $TvSeriesDetailLoadedCopyWith<$Res> implements $TvSeriesDetailStateCopyWith<$Res> {
  factory $TvSeriesDetailLoadedCopyWith(TvSeriesDetailLoaded value, $Res Function(TvSeriesDetailLoaded) _then) = _$TvSeriesDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TvSeriesDetail tvSeries, List<TvSeries> tvSeriesRecommendations, bool isAddedToWatchlist, String watchlistMessage
});




}
/// @nodoc
class _$TvSeriesDetailLoadedCopyWithImpl<$Res>
    implements $TvSeriesDetailLoadedCopyWith<$Res> {
  _$TvSeriesDetailLoadedCopyWithImpl(this._self, this._then);

  final TvSeriesDetailLoaded _self;
  final $Res Function(TvSeriesDetailLoaded) _then;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,Object? tvSeriesRecommendations = null,Object? isAddedToWatchlist = null,Object? watchlistMessage = null,}) {
  return _then(TvSeriesDetailLoaded(
tvSeries: null == tvSeries ? _self.tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as TvSeriesDetail,tvSeriesRecommendations: null == tvSeriesRecommendations ? _self._tvSeriesRecommendations : tvSeriesRecommendations // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TvSeriesDetailError implements TvSeriesDetailState {
  const TvSeriesDetailError({required this.message});
  

 final  String message;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvSeriesDetailErrorCopyWith<TvSeriesDetailError> get copyWith => _$TvSeriesDetailErrorCopyWithImpl<TvSeriesDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TvSeriesDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TvSeriesDetailErrorCopyWith<$Res> implements $TvSeriesDetailStateCopyWith<$Res> {
  factory $TvSeriesDetailErrorCopyWith(TvSeriesDetailError value, $Res Function(TvSeriesDetailError) _then) = _$TvSeriesDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TvSeriesDetailErrorCopyWithImpl<$Res>
    implements $TvSeriesDetailErrorCopyWith<$Res> {
  _$TvSeriesDetailErrorCopyWithImpl(this._self, this._then);

  final TvSeriesDetailError _self;
  final $Res Function(TvSeriesDetailError) _then;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TvSeriesDetailError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
