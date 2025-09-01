// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_tv_series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularTvSeriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularTvSeriesState()';
}


}

/// @nodoc
class $PopularTvSeriesStateCopyWith<$Res>  {
$PopularTvSeriesStateCopyWith(PopularTvSeriesState _, $Res Function(PopularTvSeriesState) __);
}


/// Adds pattern-matching-related methods to [PopularTvSeriesState].
extension PopularTvSeriesStatePatterns on PopularTvSeriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PopularTvSeriesInitial value)?  initial,TResult Function( PopularTvSeriesLoading value)?  loading,TResult Function( PopularTvSeriesLoaded value)?  loaded,TResult Function( PopularTvSeriesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PopularTvSeriesInitial() when initial != null:
return initial(_that);case PopularTvSeriesLoading() when loading != null:
return loading(_that);case PopularTvSeriesLoaded() when loaded != null:
return loaded(_that);case PopularTvSeriesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PopularTvSeriesInitial value)  initial,required TResult Function( PopularTvSeriesLoading value)  loading,required TResult Function( PopularTvSeriesLoaded value)  loaded,required TResult Function( PopularTvSeriesError value)  error,}){
final _that = this;
switch (_that) {
case PopularTvSeriesInitial():
return initial(_that);case PopularTvSeriesLoading():
return loading(_that);case PopularTvSeriesLoaded():
return loaded(_that);case PopularTvSeriesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PopularTvSeriesInitial value)?  initial,TResult? Function( PopularTvSeriesLoading value)?  loading,TResult? Function( PopularTvSeriesLoaded value)?  loaded,TResult? Function( PopularTvSeriesError value)?  error,}){
final _that = this;
switch (_that) {
case PopularTvSeriesInitial() when initial != null:
return initial(_that);case PopularTvSeriesLoading() when loading != null:
return loading(_that);case PopularTvSeriesLoaded() when loaded != null:
return loaded(_that);case PopularTvSeriesError() when error != null:
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
case PopularTvSeriesInitial() when initial != null:
return initial();case PopularTvSeriesLoading() when loading != null:
return loading();case PopularTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case PopularTvSeriesError() when error != null:
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
case PopularTvSeriesInitial():
return initial();case PopularTvSeriesLoading():
return loading();case PopularTvSeriesLoaded():
return loaded(_that.tvSeries);case PopularTvSeriesError():
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
case PopularTvSeriesInitial() when initial != null:
return initial();case PopularTvSeriesLoading() when loading != null:
return loading();case PopularTvSeriesLoaded() when loaded != null:
return loaded(_that.tvSeries);case PopularTvSeriesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PopularTvSeriesInitial implements PopularTvSeriesState {
  const PopularTvSeriesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularTvSeriesState.initial()';
}


}




/// @nodoc


class PopularTvSeriesLoading implements PopularTvSeriesState {
  const PopularTvSeriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularTvSeriesState.loading()';
}


}




/// @nodoc


class PopularTvSeriesLoaded implements PopularTvSeriesState {
  const PopularTvSeriesLoaded({required final  List<TvSeries> tvSeries}): _tvSeries = tvSeries;
  

 final  List<TvSeries> _tvSeries;
 List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}


/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularTvSeriesLoadedCopyWith<PopularTvSeriesLoaded> get copyWith => _$PopularTvSeriesLoadedCopyWithImpl<PopularTvSeriesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesLoaded&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tvSeries));

@override
String toString() {
  return 'PopularTvSeriesState.loaded(tvSeries: $tvSeries)';
}


}

/// @nodoc
abstract mixin class $PopularTvSeriesLoadedCopyWith<$Res> implements $PopularTvSeriesStateCopyWith<$Res> {
  factory $PopularTvSeriesLoadedCopyWith(PopularTvSeriesLoaded value, $Res Function(PopularTvSeriesLoaded) _then) = _$PopularTvSeriesLoadedCopyWithImpl;
@useResult
$Res call({
 List<TvSeries> tvSeries
});




}
/// @nodoc
class _$PopularTvSeriesLoadedCopyWithImpl<$Res>
    implements $PopularTvSeriesLoadedCopyWith<$Res> {
  _$PopularTvSeriesLoadedCopyWithImpl(this._self, this._then);

  final PopularTvSeriesLoaded _self;
  final $Res Function(PopularTvSeriesLoaded) _then;

/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,}) {
  return _then(PopularTvSeriesLoaded(
tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,
  ));
}


}

/// @nodoc


class PopularTvSeriesError implements PopularTvSeriesState {
  const PopularTvSeriesError({required this.message});
  

 final  String message;

/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularTvSeriesErrorCopyWith<PopularTvSeriesError> get copyWith => _$PopularTvSeriesErrorCopyWithImpl<PopularTvSeriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PopularTvSeriesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PopularTvSeriesErrorCopyWith<$Res> implements $PopularTvSeriesStateCopyWith<$Res> {
  factory $PopularTvSeriesErrorCopyWith(PopularTvSeriesError value, $Res Function(PopularTvSeriesError) _then) = _$PopularTvSeriesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PopularTvSeriesErrorCopyWithImpl<$Res>
    implements $PopularTvSeriesErrorCopyWith<$Res> {
  _$PopularTvSeriesErrorCopyWithImpl(this._self, this._then);

  final PopularTvSeriesError _self;
  final $Res Function(PopularTvSeriesError) _then;

/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PopularTvSeriesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
