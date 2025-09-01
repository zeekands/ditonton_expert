// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState()';
}


}

/// @nodoc
class $TopRatedMoviesStateCopyWith<$Res>  {
$TopRatedMoviesStateCopyWith(TopRatedMoviesState _, $Res Function(TopRatedMoviesState) __);
}


/// Adds pattern-matching-related methods to [TopRatedMoviesState].
extension TopRatedMoviesStatePatterns on TopRatedMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TopRatedMoviesInitial value)?  initial,TResult Function( TopRatedMoviesLoading value)?  loading,TResult Function( TopRatedMoviesLoaded value)?  loaded,TResult Function( TopRatedMoviesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TopRatedMoviesInitial() when initial != null:
return initial(_that);case TopRatedMoviesLoading() when loading != null:
return loading(_that);case TopRatedMoviesLoaded() when loaded != null:
return loaded(_that);case TopRatedMoviesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TopRatedMoviesInitial value)  initial,required TResult Function( TopRatedMoviesLoading value)  loading,required TResult Function( TopRatedMoviesLoaded value)  loaded,required TResult Function( TopRatedMoviesError value)  error,}){
final _that = this;
switch (_that) {
case TopRatedMoviesInitial():
return initial(_that);case TopRatedMoviesLoading():
return loading(_that);case TopRatedMoviesLoaded():
return loaded(_that);case TopRatedMoviesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TopRatedMoviesInitial value)?  initial,TResult? Function( TopRatedMoviesLoading value)?  loading,TResult? Function( TopRatedMoviesLoaded value)?  loaded,TResult? Function( TopRatedMoviesError value)?  error,}){
final _that = this;
switch (_that) {
case TopRatedMoviesInitial() when initial != null:
return initial(_that);case TopRatedMoviesLoading() when loading != null:
return loading(_that);case TopRatedMoviesLoaded() when loaded != null:
return loaded(_that);case TopRatedMoviesError() when error != null:
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
case TopRatedMoviesInitial() when initial != null:
return initial();case TopRatedMoviesLoading() when loading != null:
return loading();case TopRatedMoviesLoaded() when loaded != null:
return loaded(_that.movies);case TopRatedMoviesError() when error != null:
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
case TopRatedMoviesInitial():
return initial();case TopRatedMoviesLoading():
return loading();case TopRatedMoviesLoaded():
return loaded(_that.movies);case TopRatedMoviesError():
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
case TopRatedMoviesInitial() when initial != null:
return initial();case TopRatedMoviesLoading() when loading != null:
return loading();case TopRatedMoviesLoaded() when loaded != null:
return loaded(_that.movies);case TopRatedMoviesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TopRatedMoviesInitial implements TopRatedMoviesState {
  const TopRatedMoviesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.initial()';
}


}




/// @nodoc


class TopRatedMoviesLoading implements TopRatedMoviesState {
  const TopRatedMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.loading()';
}


}




/// @nodoc


class TopRatedMoviesLoaded implements TopRatedMoviesState {
  const TopRatedMoviesLoaded({required final  List<Movie> movies}): _movies = movies;
  

 final  List<Movie> _movies;
 List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesLoadedCopyWith<TopRatedMoviesLoaded> get copyWith => _$TopRatedMoviesLoadedCopyWithImpl<TopRatedMoviesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesLoaded&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'TopRatedMoviesState.loaded(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesLoadedCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesLoadedCopyWith(TopRatedMoviesLoaded value, $Res Function(TopRatedMoviesLoaded) _then) = _$TopRatedMoviesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies
});




}
/// @nodoc
class _$TopRatedMoviesLoadedCopyWithImpl<$Res>
    implements $TopRatedMoviesLoadedCopyWith<$Res> {
  _$TopRatedMoviesLoadedCopyWithImpl(this._self, this._then);

  final TopRatedMoviesLoaded _self;
  final $Res Function(TopRatedMoviesLoaded) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(TopRatedMoviesLoaded(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class TopRatedMoviesError implements TopRatedMoviesState {
  const TopRatedMoviesError({required this.message});
  

 final  String message;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesErrorCopyWith<TopRatedMoviesError> get copyWith => _$TopRatedMoviesErrorCopyWithImpl<TopRatedMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TopRatedMoviesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesErrorCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesErrorCopyWith(TopRatedMoviesError value, $Res Function(TopRatedMoviesError) _then) = _$TopRatedMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TopRatedMoviesErrorCopyWithImpl<$Res>
    implements $TopRatedMoviesErrorCopyWith<$Res> {
  _$TopRatedMoviesErrorCopyWithImpl(this._self, this._then);

  final TopRatedMoviesError _self;
  final $Res Function(TopRatedMoviesError) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TopRatedMoviesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
