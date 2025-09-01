// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailState()';
}


}

/// @nodoc
class $MovieDetailStateCopyWith<$Res>  {
$MovieDetailStateCopyWith(MovieDetailState _, $Res Function(MovieDetailState) __);
}


/// Adds pattern-matching-related methods to [MovieDetailState].
extension MovieDetailStatePatterns on MovieDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MovieDetailInitial value)?  initial,TResult Function( MovieDetailLoading value)?  loading,TResult Function( MovieDetailLoaded value)?  loaded,TResult Function( MovieDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MovieDetailInitial() when initial != null:
return initial(_that);case MovieDetailLoading() when loading != null:
return loading(_that);case MovieDetailLoaded() when loaded != null:
return loaded(_that);case MovieDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MovieDetailInitial value)  initial,required TResult Function( MovieDetailLoading value)  loading,required TResult Function( MovieDetailLoaded value)  loaded,required TResult Function( MovieDetailError value)  error,}){
final _that = this;
switch (_that) {
case MovieDetailInitial():
return initial(_that);case MovieDetailLoading():
return loading(_that);case MovieDetailLoaded():
return loaded(_that);case MovieDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MovieDetailInitial value)?  initial,TResult? Function( MovieDetailLoading value)?  loading,TResult? Function( MovieDetailLoaded value)?  loaded,TResult? Function( MovieDetailError value)?  error,}){
final _that = this;
switch (_that) {
case MovieDetailInitial() when initial != null:
return initial(_that);case MovieDetailLoading() when loading != null:
return loading(_that);case MovieDetailLoaded() when loaded != null:
return loaded(_that);case MovieDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( MovieDetail movieDetail,  List<Movie> movieRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MovieDetailInitial() when initial != null:
return initial();case MovieDetailLoading() when loading != null:
return loading();case MovieDetailLoaded() when loaded != null:
return loaded(_that.movieDetail,_that.movieRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case MovieDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( MovieDetail movieDetail,  List<Movie> movieRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case MovieDetailInitial():
return initial();case MovieDetailLoading():
return loading();case MovieDetailLoaded():
return loaded(_that.movieDetail,_that.movieRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case MovieDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( MovieDetail movieDetail,  List<Movie> movieRecommendations,  bool isAddedToWatchlist,  String watchlistMessage)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case MovieDetailInitial() when initial != null:
return initial();case MovieDetailLoading() when loading != null:
return loading();case MovieDetailLoaded() when loaded != null:
return loaded(_that.movieDetail,_that.movieRecommendations,_that.isAddedToWatchlist,_that.watchlistMessage);case MovieDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MovieDetailInitial implements MovieDetailState {
  const MovieDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailState.initial()';
}


}




/// @nodoc


class MovieDetailLoading implements MovieDetailState {
  const MovieDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailState.loading()';
}


}




/// @nodoc


class MovieDetailLoaded implements MovieDetailState {
  const MovieDetailLoaded({required this.movieDetail, required final  List<Movie> movieRecommendations, this.isAddedToWatchlist = false, this.watchlistMessage = ''}): _movieRecommendations = movieRecommendations;
  

 final  MovieDetail movieDetail;
 final  List<Movie> _movieRecommendations;
 List<Movie> get movieRecommendations {
  if (_movieRecommendations is EqualUnmodifiableListView) return _movieRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movieRecommendations);
}

@JsonKey() final  bool isAddedToWatchlist;
@JsonKey() final  String watchlistMessage;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailLoadedCopyWith<MovieDetailLoaded> get copyWith => _$MovieDetailLoadedCopyWithImpl<MovieDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailLoaded&&(identical(other.movieDetail, movieDetail) || other.movieDetail == movieDetail)&&const DeepCollectionEquality().equals(other._movieRecommendations, _movieRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetail,const DeepCollectionEquality().hash(_movieRecommendations),isAddedToWatchlist,watchlistMessage);

@override
String toString() {
  return 'MovieDetailState.loaded(movieDetail: $movieDetail, movieRecommendations: $movieRecommendations, isAddedToWatchlist: $isAddedToWatchlist, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class $MovieDetailLoadedCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailLoadedCopyWith(MovieDetailLoaded value, $Res Function(MovieDetailLoaded) _then) = _$MovieDetailLoadedCopyWithImpl;
@useResult
$Res call({
 MovieDetail movieDetail, List<Movie> movieRecommendations, bool isAddedToWatchlist, String watchlistMessage
});




}
/// @nodoc
class _$MovieDetailLoadedCopyWithImpl<$Res>
    implements $MovieDetailLoadedCopyWith<$Res> {
  _$MovieDetailLoadedCopyWithImpl(this._self, this._then);

  final MovieDetailLoaded _self;
  final $Res Function(MovieDetailLoaded) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieDetail = null,Object? movieRecommendations = null,Object? isAddedToWatchlist = null,Object? watchlistMessage = null,}) {
  return _then(MovieDetailLoaded(
movieDetail: null == movieDetail ? _self.movieDetail : movieDetail // ignore: cast_nullable_to_non_nullable
as MovieDetail,movieRecommendations: null == movieRecommendations ? _self._movieRecommendations : movieRecommendations // ignore: cast_nullable_to_non_nullable
as List<Movie>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MovieDetailError implements MovieDetailState {
  const MovieDetailError({required this.message});
  

 final  String message;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailErrorCopyWith<MovieDetailError> get copyWith => _$MovieDetailErrorCopyWithImpl<MovieDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MovieDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MovieDetailErrorCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailErrorCopyWith(MovieDetailError value, $Res Function(MovieDetailError) _then) = _$MovieDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MovieDetailErrorCopyWithImpl<$Res>
    implements $MovieDetailErrorCopyWith<$Res> {
  _$MovieDetailErrorCopyWithImpl(this._self, this._then);

  final MovieDetailError _self;
  final $Res Function(MovieDetailError) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MovieDetailError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
