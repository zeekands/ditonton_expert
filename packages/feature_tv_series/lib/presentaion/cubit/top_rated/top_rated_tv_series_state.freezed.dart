// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_tv_series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedTvSeriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedTvSeriesState()';
}


}

/// @nodoc
class $TopRatedTvSeriesStateCopyWith<$Res>  {
$TopRatedTvSeriesStateCopyWith(TopRatedTvSeriesState _, $Res Function(TopRatedTvSeriesState) __);
}


/// Adds pattern-matching-related methods to [TopRatedTvSeriesState].
extension TopRatedTvSeriesStatePatterns on TopRatedTvSeriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TopRatedTvSeriesInitial value)?  initial,TResult Function( TopRatedTvSeriesLoading value)?  loading,TResult Function( TopRatedTvSeriesLoaded value)?  loaded,TResult Function( TopRatedTvSeriesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TopRatedTvSeriesInitial() when initial != null:
return initial(_that);case TopRatedTvSeriesLoading() when loading != null:
return loading(_that);case TopRatedTvSeriesLoaded() when loaded != null:
return loaded(_that);case TopRatedTvSeriesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TopRatedTvSeriesInitial value)  initial,required TResult Function( TopRatedTvSeriesLoading value)  loading,required TResult Function( TopRatedTvSeriesLoaded value)  loaded,required TResult Function( TopRatedTvSeriesError value)  error,}){
final _that = this;
switch (_that) {
case TopRatedTvSeriesInitial():
return initial(_that);case TopRatedTvSeriesLoading():
return loading(_that);case TopRatedTvSeriesLoaded():
return loaded(_that);case TopRatedTvSeriesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TopRatedTvSeriesInitial value)?  initial,TResult? Function( TopRatedTvSeriesLoading value)?  loading,TResult? Function( TopRatedTvSeriesLoaded value)?  loaded,TResult? Function( TopRatedTvSeriesError value)?  error,}){
final _that = this;
switch (_that) {
case TopRatedTvSeriesInitial() when initial != null:
return initial(_that);case TopRatedTvSeriesLoading() when loading != null:
return loading(_that);case TopRatedTvSeriesLoaded() when loaded != null:
return loaded(_that);case TopRatedTvSeriesError() when error != null:
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
case TopRatedTvSeriesInitial() when initial != null:
return initial();case TopRatedTvSeriesLoading() when loading != null:
return loading();case TopRatedTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case TopRatedTvSeriesError() when error != null:
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
case TopRatedTvSeriesInitial():
return initial();case TopRatedTvSeriesLoading():
return loading();case TopRatedTvSeriesLoaded():
return loaded(_that.tvSeries);case TopRatedTvSeriesError():
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
case TopRatedTvSeriesInitial() when initial != null:
return initial();case TopRatedTvSeriesLoading() when loading != null:
return loading();case TopRatedTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case TopRatedTvSeriesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TopRatedTvSeriesInitial implements TopRatedTvSeriesState {
  const TopRatedTvSeriesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedTvSeriesState.initial()';
}


}




/// @nodoc


class TopRatedTvSeriesLoading implements TopRatedTvSeriesState {
  const TopRatedTvSeriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedTvSeriesState.loading()';
}


}




/// @nodoc


class TopRatedTvSeriesLoaded implements TopRatedTvSeriesState {
  const TopRatedTvSeriesLoaded({required final  List<TvSeries> tvSeries}): _tvSeries = tvSeries;
  

 final  List<TvSeries> _tvSeries;
 List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}


/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedTvSeriesLoadedCopyWith<TopRatedTvSeriesLoaded> get copyWith => _$TopRatedTvSeriesLoadedCopyWithImpl<TopRatedTvSeriesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesLoaded&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tvSeries));

@override
String toString() {
  return 'TopRatedTvSeriesState.loaded(tvSeries: $tvSeries)';
}


}

/// @nodoc
abstract mixin class $TopRatedTvSeriesLoadedCopyWith<$Res> implements $TopRatedTvSeriesStateCopyWith<$Res> {
  factory $TopRatedTvSeriesLoadedCopyWith(TopRatedTvSeriesLoaded value, $Res Function(TopRatedTvSeriesLoaded) _then) = _$TopRatedTvSeriesLoadedCopyWithImpl;
@useResult
$Res call({
 List<TvSeries> tvSeries
});




}
/// @nodoc
class _$TopRatedTvSeriesLoadedCopyWithImpl<$Res>
    implements $TopRatedTvSeriesLoadedCopyWith<$Res> {
  _$TopRatedTvSeriesLoadedCopyWithImpl(this._self, this._then);

  final TopRatedTvSeriesLoaded _self;
  final $Res Function(TopRatedTvSeriesLoaded) _then;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,}) {
  return _then(TopRatedTvSeriesLoaded(
tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,
  ));
}


}

/// @nodoc


class TopRatedTvSeriesError implements TopRatedTvSeriesState {
  const TopRatedTvSeriesError({required this.message});
  

 final  String message;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedTvSeriesErrorCopyWith<TopRatedTvSeriesError> get copyWith => _$TopRatedTvSeriesErrorCopyWithImpl<TopRatedTvSeriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TopRatedTvSeriesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TopRatedTvSeriesErrorCopyWith<$Res> implements $TopRatedTvSeriesStateCopyWith<$Res> {
  factory $TopRatedTvSeriesErrorCopyWith(TopRatedTvSeriesError value, $Res Function(TopRatedTvSeriesError) _then) = _$TopRatedTvSeriesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TopRatedTvSeriesErrorCopyWithImpl<$Res>
    implements $TopRatedTvSeriesErrorCopyWith<$Res> {
  _$TopRatedTvSeriesErrorCopyWithImpl(this._self, this._then);

  final TopRatedTvSeriesError _self;
  final $Res Function(TopRatedTvSeriesError) _then;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TopRatedTvSeriesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
