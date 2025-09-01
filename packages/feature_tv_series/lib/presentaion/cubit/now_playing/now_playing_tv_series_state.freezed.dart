// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'now_playing_tv_series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NowPlayingTvSeriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingTvSeriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingTvSeriesState()';
}


}

/// @nodoc
class $NowPlayingTvSeriesStateCopyWith<$Res>  {
$NowPlayingTvSeriesStateCopyWith(NowPlayingTvSeriesState _, $Res Function(NowPlayingTvSeriesState) __);
}


/// Adds pattern-matching-related methods to [NowPlayingTvSeriesState].
extension NowPlayingTvSeriesStatePatterns on NowPlayingTvSeriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NowPlayingTvSeriesInitial value)?  initial,TResult Function( NowPlayingTvSeriesLoading value)?  loading,TResult Function( NowPlayingTvSeriesLoaded value)?  loaded,TResult Function( NowPlayingTvSeriesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial() when initial != null:
return initial(_that);case NowPlayingTvSeriesLoading() when loading != null:
return loading(_that);case NowPlayingTvSeriesLoaded() when loaded != null:
return loaded(_that);case NowPlayingTvSeriesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NowPlayingTvSeriesInitial value)  initial,required TResult Function( NowPlayingTvSeriesLoading value)  loading,required TResult Function( NowPlayingTvSeriesLoaded value)  loaded,required TResult Function( NowPlayingTvSeriesError value)  error,}){
final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial():
return initial(_that);case NowPlayingTvSeriesLoading():
return loading(_that);case NowPlayingTvSeriesLoaded():
return loaded(_that);case NowPlayingTvSeriesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NowPlayingTvSeriesInitial value)?  initial,TResult? Function( NowPlayingTvSeriesLoading value)?  loading,TResult? Function( NowPlayingTvSeriesLoaded value)?  loaded,TResult? Function( NowPlayingTvSeriesError value)?  error,}){
final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial() when initial != null:
return initial(_that);case NowPlayingTvSeriesLoading() when loading != null:
return loading(_that);case NowPlayingTvSeriesLoaded() when loaded != null:
return loaded(_that);case NowPlayingTvSeriesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TvSeries> tvSeries)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial() when initial != null:
return initial();case NowPlayingTvSeriesLoading() when loading != null:
return loading();case NowPlayingTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case NowPlayingTvSeriesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TvSeries> tvSeries)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial():
return initial();case NowPlayingTvSeriesLoading():
return loading();case NowPlayingTvSeriesLoaded():
return loaded(_that.tvSeries);case NowPlayingTvSeriesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TvSeries> tvSeries)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NowPlayingTvSeriesInitial() when initial != null:
return initial();case NowPlayingTvSeriesLoading() when loading != null:
return loading();case NowPlayingTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case NowPlayingTvSeriesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NowPlayingTvSeriesInitial implements NowPlayingTvSeriesState {
  const NowPlayingTvSeriesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingTvSeriesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingTvSeriesState.initial()';
}


}




/// @nodoc


class NowPlayingTvSeriesLoading implements NowPlayingTvSeriesState {
  const NowPlayingTvSeriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingTvSeriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingTvSeriesState.loading()';
}


}




/// @nodoc


class NowPlayingTvSeriesLoaded implements NowPlayingTvSeriesState {
  const NowPlayingTvSeriesLoaded({required final  List<TvSeries> tvSeries}): _tvSeries = tvSeries;
  

 final  List<TvSeries> _tvSeries;
 List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}


/// Create a copy of NowPlayingTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowPlayingTvSeriesLoadedCopyWith<NowPlayingTvSeriesLoaded> get copyWith => _$NowPlayingTvSeriesLoadedCopyWithImpl<NowPlayingTvSeriesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingTvSeriesLoaded&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tvSeries));

@override
String toString() {
  return 'NowPlayingTvSeriesState.loaded(tvSeries: $tvSeries)';
}


}

/// @nodoc
abstract mixin class $NowPlayingTvSeriesLoadedCopyWith<$Res> implements $NowPlayingTvSeriesStateCopyWith<$Res> {
  factory $NowPlayingTvSeriesLoadedCopyWith(NowPlayingTvSeriesLoaded value, $Res Function(NowPlayingTvSeriesLoaded) _then) = _$NowPlayingTvSeriesLoadedCopyWithImpl;
@useResult
$Res call({
 List<TvSeries> tvSeries
});




}
/// @nodoc
class _$NowPlayingTvSeriesLoadedCopyWithImpl<$Res>
    implements $NowPlayingTvSeriesLoadedCopyWith<$Res> {
  _$NowPlayingTvSeriesLoadedCopyWithImpl(this._self, this._then);

  final NowPlayingTvSeriesLoaded _self;
  final $Res Function(NowPlayingTvSeriesLoaded) _then;

/// Create a copy of NowPlayingTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,}) {
  return _then(NowPlayingTvSeriesLoaded(
tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,
  ));
}


}

/// @nodoc


class NowPlayingTvSeriesError implements NowPlayingTvSeriesState {
  const NowPlayingTvSeriesError({required this.message});
  

 final  String message;

/// Create a copy of NowPlayingTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowPlayingTvSeriesErrorCopyWith<NowPlayingTvSeriesError> get copyWith => _$NowPlayingTvSeriesErrorCopyWithImpl<NowPlayingTvSeriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingTvSeriesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NowPlayingTvSeriesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NowPlayingTvSeriesErrorCopyWith<$Res> implements $NowPlayingTvSeriesStateCopyWith<$Res> {
  factory $NowPlayingTvSeriesErrorCopyWith(NowPlayingTvSeriesError value, $Res Function(NowPlayingTvSeriesError) _then) = _$NowPlayingTvSeriesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NowPlayingTvSeriesErrorCopyWithImpl<$Res>
    implements $NowPlayingTvSeriesErrorCopyWith<$Res> {
  _$NowPlayingTvSeriesErrorCopyWithImpl(this._self, this._then);

  final NowPlayingTvSeriesError _self;
  final $Res Function(NowPlayingTvSeriesError) _then;

/// Create a copy of NowPlayingTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NowPlayingTvSeriesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
