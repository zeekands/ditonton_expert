// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState()';
}


}

/// @nodoc
class $PopularMoviesStateCopyWith<$Res>  {
$PopularMoviesStateCopyWith(PopularMoviesState _, $Res Function(PopularMoviesState) __);
}


/// Adds pattern-matching-related methods to [PopularMoviesState].
extension PopularMoviesStatePatterns on PopularMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PopularMoviesInitial value)?  initial,TResult Function( PopularMoviesLoading value)?  loading,TResult Function( PopularMoviesLoaded value)?  loaded,TResult Function( PopularMoviesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PopularMoviesInitial() when initial != null:
return initial(_that);case PopularMoviesLoading() when loading != null:
return loading(_that);case PopularMoviesLoaded() when loaded != null:
return loaded(_that);case PopularMoviesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PopularMoviesInitial value)  initial,required TResult Function( PopularMoviesLoading value)  loading,required TResult Function( PopularMoviesLoaded value)  loaded,required TResult Function( PopularMoviesError value)  error,}){
final _that = this;
switch (_that) {
case PopularMoviesInitial():
return initial(_that);case PopularMoviesLoading():
return loading(_that);case PopularMoviesLoaded():
return loaded(_that);case PopularMoviesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PopularMoviesInitial value)?  initial,TResult? Function( PopularMoviesLoading value)?  loading,TResult? Function( PopularMoviesLoaded value)?  loaded,TResult? Function( PopularMoviesError value)?  error,}){
final _that = this;
switch (_that) {
case PopularMoviesInitial() when initial != null:
return initial(_that);case PopularMoviesLoading() when loading != null:
return loading(_that);case PopularMoviesLoaded() when loaded != null:
return loaded(_that);case PopularMoviesError() when error != null:
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
case PopularMoviesInitial() when initial != null:
return initial();case PopularMoviesLoading() when loading != null:
return loading();case PopularMoviesLoaded() when loaded != null:
return loaded(_that.movies);case PopularMoviesError() when error != null:
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
case PopularMoviesInitial():
return initial();case PopularMoviesLoading():
return loading();case PopularMoviesLoaded():
return loaded(_that.movies);case PopularMoviesError():
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
case PopularMoviesInitial() when initial != null:
return initial();case PopularMoviesLoading() when loading != null:
return loading();case PopularMoviesLoaded() when loaded != null:
return loaded(_that.movies);case PopularMoviesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PopularMoviesInitial implements PopularMoviesState {
  const PopularMoviesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState.initial()';
}


}




/// @nodoc


class PopularMoviesLoading implements PopularMoviesState {
  const PopularMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState.loading()';
}


}




/// @nodoc


class PopularMoviesLoaded implements PopularMoviesState {
  const PopularMoviesLoaded({required final  List<Movie> movies}): _movies = movies;
  

 final  List<Movie> _movies;
 List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMoviesLoadedCopyWith<PopularMoviesLoaded> get copyWith => _$PopularMoviesLoadedCopyWithImpl<PopularMoviesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesLoaded&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'PopularMoviesState.loaded(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $PopularMoviesLoadedCopyWith<$Res> implements $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesLoadedCopyWith(PopularMoviesLoaded value, $Res Function(PopularMoviesLoaded) _then) = _$PopularMoviesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies
});




}
/// @nodoc
class _$PopularMoviesLoadedCopyWithImpl<$Res>
    implements $PopularMoviesLoadedCopyWith<$Res> {
  _$PopularMoviesLoadedCopyWithImpl(this._self, this._then);

  final PopularMoviesLoaded _self;
  final $Res Function(PopularMoviesLoaded) _then;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(PopularMoviesLoaded(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class PopularMoviesError implements PopularMoviesState {
  const PopularMoviesError({required this.message});
  

 final  String message;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMoviesErrorCopyWith<PopularMoviesError> get copyWith => _$PopularMoviesErrorCopyWithImpl<PopularMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PopularMoviesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PopularMoviesErrorCopyWith<$Res> implements $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesErrorCopyWith(PopularMoviesError value, $Res Function(PopularMoviesError) _then) = _$PopularMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PopularMoviesErrorCopyWithImpl<$Res>
    implements $PopularMoviesErrorCopyWith<$Res> {
  _$PopularMoviesErrorCopyWithImpl(this._self, this._then);

  final PopularMoviesError _self;
  final $Res Function(PopularMoviesError) _then;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PopularMoviesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
