// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mypage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPageState {

 bool get isLogged; String get userName; String? get imageUri; bool get isAlarmEnabled;
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPageStateCopyWith<MyPageState> get copyWith => _$MyPageStateCopyWithImpl<MyPageState>(this as MyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPageState&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.imageUri, imageUri) || other.imageUri == imageUri)&&(identical(other.isAlarmEnabled, isAlarmEnabled) || other.isAlarmEnabled == isAlarmEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isLogged,userName,imageUri,isAlarmEnabled);

@override
String toString() {
  return 'MyPageState(isLogged: $isLogged, userName: $userName, imageUri: $imageUri, isAlarmEnabled: $isAlarmEnabled)';
}


}

/// @nodoc
abstract mixin class $MyPageStateCopyWith<$Res>  {
  factory $MyPageStateCopyWith(MyPageState value, $Res Function(MyPageState) _then) = _$MyPageStateCopyWithImpl;
@useResult
$Res call({
 bool isLogged, String userName, String? imageUri, bool isAlarmEnabled
});




}
/// @nodoc
class _$MyPageStateCopyWithImpl<$Res>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._self, this._then);

  final MyPageState _self;
  final $Res Function(MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogged = null,Object? userName = null,Object? imageUri = freezed,Object? isAlarmEnabled = null,}) {
  return _then(_self.copyWith(
isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,imageUri: freezed == imageUri ? _self.imageUri : imageUri // ignore: cast_nullable_to_non_nullable
as String?,isAlarmEnabled: null == isAlarmEnabled ? _self.isAlarmEnabled : isAlarmEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MyPageState].
extension MyPageStatePatterns on MyPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPageState value)  $default,){
final _that = this;
switch (_that) {
case _MyPageState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPageState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLogged,  String userName,  String? imageUri,  bool isAlarmEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.isLogged,_that.userName,_that.imageUri,_that.isAlarmEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLogged,  String userName,  String? imageUri,  bool isAlarmEnabled)  $default,) {final _that = this;
switch (_that) {
case _MyPageState():
return $default(_that.isLogged,_that.userName,_that.imageUri,_that.isAlarmEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLogged,  String userName,  String? imageUri,  bool isAlarmEnabled)?  $default,) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.isLogged,_that.userName,_that.imageUri,_that.isAlarmEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _MyPageState implements MyPageState {
  const _MyPageState({this.isLogged = false, this.userName = '', this.imageUri, this.isAlarmEnabled = false});
  

@override@JsonKey() final  bool isLogged;
@override@JsonKey() final  String userName;
@override final  String? imageUri;
@override@JsonKey() final  bool isAlarmEnabled;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPageStateCopyWith<_MyPageState> get copyWith => __$MyPageStateCopyWithImpl<_MyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPageState&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.imageUri, imageUri) || other.imageUri == imageUri)&&(identical(other.isAlarmEnabled, isAlarmEnabled) || other.isAlarmEnabled == isAlarmEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isLogged,userName,imageUri,isAlarmEnabled);

@override
String toString() {
  return 'MyPageState(isLogged: $isLogged, userName: $userName, imageUri: $imageUri, isAlarmEnabled: $isAlarmEnabled)';
}


}

/// @nodoc
abstract mixin class _$MyPageStateCopyWith<$Res> implements $MyPageStateCopyWith<$Res> {
  factory _$MyPageStateCopyWith(_MyPageState value, $Res Function(_MyPageState) _then) = __$MyPageStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLogged, String userName, String? imageUri, bool isAlarmEnabled
});




}
/// @nodoc
class __$MyPageStateCopyWithImpl<$Res>
    implements _$MyPageStateCopyWith<$Res> {
  __$MyPageStateCopyWithImpl(this._self, this._then);

  final _MyPageState _self;
  final $Res Function(_MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogged = null,Object? userName = null,Object? imageUri = freezed,Object? isAlarmEnabled = null,}) {
  return _then(_MyPageState(
isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,imageUri: freezed == imageUri ? _self.imageUri : imageUri // ignore: cast_nullable_to_non_nullable
as String?,isAlarmEnabled: null == isAlarmEnabled ? _self.isAlarmEnabled : isAlarmEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
