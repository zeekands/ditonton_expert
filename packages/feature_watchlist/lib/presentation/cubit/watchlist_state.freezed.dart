// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState()';
}


}

/// @nodoc
class $WatchlistStateCopyWith<$Res>  {
$WatchlistStateCopyWith(WatchlistState _, $Res Function(WatchlistState) __);
}


/// Adds pattern-matching-related methods to [WatchlistState].
extension WatchlistStatePatterns on WatchlistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WatchlistInitial value)?  initial,TResult Function( WatchlistLoading value)?  loading,TResult Function( WatchlistLoaded value)?  loaded,TResult Function( WatchlistError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WatchlistInitial() when initial != null:
return initial(_that);case WatchlistLoading() when loading != null:
return loading(_that);case WatchlistLoaded() when loaded != null:
return loaded(_that);case WatchlistError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WatchlistInitial value)  initial,required TResult Function( WatchlistLoading value)  loading,required TResult Function( WatchlistLoaded value)  loaded,required TResult Function( WatchlistError value)  error,}){
final _that = this;
switch (_that) {
case WatchlistInitial():
return initial(_that);case WatchlistLoading():
return loading(_that);case WatchlistLoaded():
return loaded(_that);case WatchlistError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WatchlistInitial value)?  initial,TResult? Function( WatchlistLoading value)?  loading,TResult? Function( WatchlistLoaded value)?  loaded,TResult? Function( WatchlistError value)?  error,}){
final _that = this;
switch (_that) {
case WatchlistInitial() when initial != null:
return initial(_that);case WatchlistLoading() when loading != null:
return loading(_that);case WatchlistLoaded() when loaded != null:
return loaded(_that);case WatchlistError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Content> watchlist)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WatchlistInitial() when initial != null:
return initial();case WatchlistLoading() when loading != null:
return loading();case WatchlistLoaded() when loaded != null:
return loaded(_that.watchlist);case WatchlistError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Content> watchlist)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WatchlistInitial():
return initial();case WatchlistLoading():
return loading();case WatchlistLoaded():
return loaded(_that.watchlist);case WatchlistError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Content> watchlist)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WatchlistInitial() when initial != null:
return initial();case WatchlistLoading() when loading != null:
return loading();case WatchlistLoaded() when loaded != null:
return loaded(_that.watchlist);case WatchlistError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WatchlistInitial implements WatchlistState {
  const WatchlistInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState.initial()';
}


}




/// @nodoc


class WatchlistLoading implements WatchlistState {
  const WatchlistLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState.loading()';
}


}




/// @nodoc


class WatchlistLoaded implements WatchlistState {
  const WatchlistLoaded({required final  List<Content> watchlist}): _watchlist = watchlist;
  

 final  List<Content> _watchlist;
 List<Content> get watchlist {
  if (_watchlist is EqualUnmodifiableListView) return _watchlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchlist);
}


/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistLoadedCopyWith<WatchlistLoaded> get copyWith => _$WatchlistLoadedCopyWithImpl<WatchlistLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistLoaded&&const DeepCollectionEquality().equals(other._watchlist, _watchlist));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_watchlist));

@override
String toString() {
  return 'WatchlistState.loaded(watchlist: $watchlist)';
}


}

/// @nodoc
abstract mixin class $WatchlistLoadedCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
  factory $WatchlistLoadedCopyWith(WatchlistLoaded value, $Res Function(WatchlistLoaded) _then) = _$WatchlistLoadedCopyWithImpl;
@useResult
$Res call({
 List<Content> watchlist
});




}
/// @nodoc
class _$WatchlistLoadedCopyWithImpl<$Res>
    implements $WatchlistLoadedCopyWith<$Res> {
  _$WatchlistLoadedCopyWithImpl(this._self, this._then);

  final WatchlistLoaded _self;
  final $Res Function(WatchlistLoaded) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? watchlist = null,}) {
  return _then(WatchlistLoaded(
watchlist: null == watchlist ? _self._watchlist : watchlist // ignore: cast_nullable_to_non_nullable
as List<Content>,
  ));
}


}

/// @nodoc


class WatchlistError implements WatchlistState {
  const WatchlistError({required this.message});
  

 final  String message;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistErrorCopyWith<WatchlistError> get copyWith => _$WatchlistErrorCopyWithImpl<WatchlistError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WatchlistState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WatchlistErrorCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
  factory $WatchlistErrorCopyWith(WatchlistError value, $Res Function(WatchlistError) _then) = _$WatchlistErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WatchlistErrorCopyWithImpl<$Res>
    implements $WatchlistErrorCopyWith<$Res> {
  _$WatchlistErrorCopyWithImpl(this._self, this._then);

  final WatchlistError _self;
  final $Res Function(WatchlistError) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WatchlistError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
