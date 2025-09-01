// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'now_playing_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NowPlayingMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingMoviesState()';
}


}

/// @nodoc
class $NowPlayingMoviesStateCopyWith<$Res>  {
$NowPlayingMoviesStateCopyWith(NowPlayingMoviesState _, $Res Function(NowPlayingMoviesState) __);
}


/// Adds pattern-matching-related methods to [NowPlayingMoviesState].
extension NowPlayingMoviesStatePatterns on NowPlayingMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NowPlayingMoviesInitial value)?  initial,TResult Function( NowPlayingMoviesLoading value)?  loading,TResult Function( NowPlayingMoviesLoaded value)?  loaded,TResult Function( NowPlayingMoviesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NowPlayingMoviesInitial() when initial != null:
return initial(_that);case NowPlayingMoviesLoading() when loading != null:
return loading(_that);case NowPlayingMoviesLoaded() when loaded != null:
return loaded(_that);case NowPlayingMoviesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NowPlayingMoviesInitial value)  initial,required TResult Function( NowPlayingMoviesLoading value)  loading,required TResult Function( NowPlayingMoviesLoaded value)  loaded,required TResult Function( NowPlayingMoviesError value)  error,}){
final _that = this;
switch (_that) {
case NowPlayingMoviesInitial():
return initial(_that);case NowPlayingMoviesLoading():
return loading(_that);case NowPlayingMoviesLoaded():
return loaded(_that);case NowPlayingMoviesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NowPlayingMoviesInitial value)?  initial,TResult? Function( NowPlayingMoviesLoading value)?  loading,TResult? Function( NowPlayingMoviesLoaded value)?  loaded,TResult? Function( NowPlayingMoviesError value)?  error,}){
final _that = this;
switch (_that) {
case NowPlayingMoviesInitial() when initial != null:
return initial(_that);case NowPlayingMoviesLoading() when loading != null:
return loading(_that);case NowPlayingMoviesLoaded() when loaded != null:
return loaded(_that);case NowPlayingMoviesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Movie> movies)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NowPlayingMoviesInitial() when initial != null:
return initial();case NowPlayingMoviesLoading() when loading != null:
return loading();case NowPlayingMoviesLoaded() when loaded != null:
return loaded(_that.movies);case NowPlayingMoviesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Movie> movies)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NowPlayingMoviesInitial():
return initial();case NowPlayingMoviesLoading():
return loading();case NowPlayingMoviesLoaded():
return loaded(_that.movies);case NowPlayingMoviesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Movie> movies)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NowPlayingMoviesInitial() when initial != null:
return initial();case NowPlayingMoviesLoading() when loading != null:
return loading();case NowPlayingMoviesLoaded() when loaded != null:
return loaded(_that.movies);case NowPlayingMoviesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NowPlayingMoviesInitial implements NowPlayingMoviesState {
  const NowPlayingMoviesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingMoviesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingMoviesState.initial()';
}


}




/// @nodoc


class NowPlayingMoviesLoading implements NowPlayingMoviesState {
  const NowPlayingMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NowPlayingMoviesState.loading()';
}


}




/// @nodoc


class NowPlayingMoviesLoaded implements NowPlayingMoviesState {
  const NowPlayingMoviesLoaded({required final  List<Movie> movies}): _movies = movies;
  

 final  List<Movie> _movies;
 List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of NowPlayingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowPlayingMoviesLoadedCopyWith<NowPlayingMoviesLoaded> get copyWith => _$NowPlayingMoviesLoadedCopyWithImpl<NowPlayingMoviesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingMoviesLoaded&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'NowPlayingMoviesState.loaded(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $NowPlayingMoviesLoadedCopyWith<$Res> implements $NowPlayingMoviesStateCopyWith<$Res> {
  factory $NowPlayingMoviesLoadedCopyWith(NowPlayingMoviesLoaded value, $Res Function(NowPlayingMoviesLoaded) _then) = _$NowPlayingMoviesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies
});




}
/// @nodoc
class _$NowPlayingMoviesLoadedCopyWithImpl<$Res>
    implements $NowPlayingMoviesLoadedCopyWith<$Res> {
  _$NowPlayingMoviesLoadedCopyWithImpl(this._self, this._then);

  final NowPlayingMoviesLoaded _self;
  final $Res Function(NowPlayingMoviesLoaded) _then;

/// Create a copy of NowPlayingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(NowPlayingMoviesLoaded(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class NowPlayingMoviesError implements NowPlayingMoviesState {
  const NowPlayingMoviesError({required this.message});
  

 final  String message;

/// Create a copy of NowPlayingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowPlayingMoviesErrorCopyWith<NowPlayingMoviesError> get copyWith => _$NowPlayingMoviesErrorCopyWithImpl<NowPlayingMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NowPlayingMoviesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NowPlayingMoviesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NowPlayingMoviesErrorCopyWith<$Res> implements $NowPlayingMoviesStateCopyWith<$Res> {
  factory $NowPlayingMoviesErrorCopyWith(NowPlayingMoviesError value, $Res Function(NowPlayingMoviesError) _then) = _$NowPlayingMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NowPlayingMoviesErrorCopyWithImpl<$Res>
    implements $NowPlayingMoviesErrorCopyWith<$Res> {
  _$NowPlayingMoviesErrorCopyWithImpl(this._self, this._then);

  final NowPlayingMoviesError _self;
  final $Res Function(NowPlayingMoviesError) _then;

/// Create a copy of NowPlayingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NowPlayingMoviesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
