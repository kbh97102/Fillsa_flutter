// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StreakInfo {

 int get currentStreak; bool get isTodayWritten; int get maxStreak;
/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreakInfoCopyWith<StreakInfo> get copyWith => _$StreakInfoCopyWithImpl<StreakInfo>(this as StreakInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreakInfo&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.isTodayWritten, isTodayWritten) || other.isTodayWritten == isTodayWritten)&&(identical(other.maxStreak, maxStreak) || other.maxStreak == maxStreak));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,isTodayWritten,maxStreak);

@override
String toString() {
  return 'StreakInfo(currentStreak: $currentStreak, isTodayWritten: $isTodayWritten, maxStreak: $maxStreak)';
}


}

/// @nodoc
abstract mixin class $StreakInfoCopyWith<$Res>  {
  factory $StreakInfoCopyWith(StreakInfo value, $Res Function(StreakInfo) _then) = _$StreakInfoCopyWithImpl;
@useResult
$Res call({
 int currentStreak, bool isTodayWritten, int maxStreak
});




}
/// @nodoc
class _$StreakInfoCopyWithImpl<$Res>
    implements $StreakInfoCopyWith<$Res> {
  _$StreakInfoCopyWithImpl(this._self, this._then);

  final StreakInfo _self;
  final $Res Function(StreakInfo) _then;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? isTodayWritten = null,Object? maxStreak = null,}) {
  return _then(_self.copyWith(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,isTodayWritten: null == isTodayWritten ? _self.isTodayWritten : isTodayWritten // ignore: cast_nullable_to_non_nullable
as bool,maxStreak: null == maxStreak ? _self.maxStreak : maxStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StreakInfo].
extension StreakInfoPatterns on StreakInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreakInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreakInfo value)  $default,){
final _that = this;
switch (_that) {
case _StreakInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreakInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  bool isTodayWritten,  int maxStreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
return $default(_that.currentStreak,_that.isTodayWritten,_that.maxStreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  bool isTodayWritten,  int maxStreak)  $default,) {final _that = this;
switch (_that) {
case _StreakInfo():
return $default(_that.currentStreak,_that.isTodayWritten,_that.maxStreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  bool isTodayWritten,  int maxStreak)?  $default,) {final _that = this;
switch (_that) {
case _StreakInfo() when $default != null:
return $default(_that.currentStreak,_that.isTodayWritten,_that.maxStreak);case _:
  return null;

}
}

}

/// @nodoc


class _StreakInfo implements StreakInfo {
  const _StreakInfo({this.currentStreak = 0, this.isTodayWritten = false, this.maxStreak = 0});
  

@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  bool isTodayWritten;
@override@JsonKey() final  int maxStreak;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreakInfoCopyWith<_StreakInfo> get copyWith => __$StreakInfoCopyWithImpl<_StreakInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreakInfo&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.isTodayWritten, isTodayWritten) || other.isTodayWritten == isTodayWritten)&&(identical(other.maxStreak, maxStreak) || other.maxStreak == maxStreak));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,isTodayWritten,maxStreak);

@override
String toString() {
  return 'StreakInfo(currentStreak: $currentStreak, isTodayWritten: $isTodayWritten, maxStreak: $maxStreak)';
}


}

/// @nodoc
abstract mixin class _$StreakInfoCopyWith<$Res> implements $StreakInfoCopyWith<$Res> {
  factory _$StreakInfoCopyWith(_StreakInfo value, $Res Function(_StreakInfo) _then) = __$StreakInfoCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, bool isTodayWritten, int maxStreak
});




}
/// @nodoc
class __$StreakInfoCopyWithImpl<$Res>
    implements _$StreakInfoCopyWith<$Res> {
  __$StreakInfoCopyWithImpl(this._self, this._then);

  final _StreakInfo _self;
  final $Res Function(_StreakInfo) _then;

/// Create a copy of StreakInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? isTodayWritten = null,Object? maxStreak = null,}) {
  return _then(_StreakInfo(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,isTodayWritten: null == isTodayWritten ? _self.isTodayWritten : isTodayWritten // ignore: cast_nullable_to_non_nullable
as bool,maxStreak: null == maxStreak ? _self.maxStreak : maxStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
