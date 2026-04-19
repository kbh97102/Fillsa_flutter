// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarState {

 MemberMonthlyQuoteResponse? get monthlyData; DateTime get selectedDay; String get selectedDayQuote; bool get isLogged;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&(identical(other.monthlyData, monthlyData) || other.monthlyData == monthlyData)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.selectedDayQuote, selectedDayQuote) || other.selectedDayQuote == selectedDayQuote)&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged));
}


@override
int get hashCode => Object.hash(runtimeType,monthlyData,selectedDay,selectedDayQuote,isLogged);

@override
String toString() {
  return 'CalendarState(monthlyData: $monthlyData, selectedDay: $selectedDay, selectedDayQuote: $selectedDayQuote, isLogged: $isLogged)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 MemberMonthlyQuoteResponse? monthlyData, DateTime selectedDay, String selectedDayQuote, bool isLogged
});




}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthlyData = freezed,Object? selectedDay = null,Object? selectedDayQuote = null,Object? isLogged = null,}) {
  return _then(_self.copyWith(
monthlyData: freezed == monthlyData ? _self.monthlyData : monthlyData // ignore: cast_nullable_to_non_nullable
as MemberMonthlyQuoteResponse?,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDayQuote: null == selectedDayQuote ? _self.selectedDayQuote : selectedDayQuote // ignore: cast_nullable_to_non_nullable
as String,isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MemberMonthlyQuoteResponse? monthlyData,  DateTime selectedDay,  String selectedDayQuote,  bool isLogged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.monthlyData,_that.selectedDay,_that.selectedDayQuote,_that.isLogged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MemberMonthlyQuoteResponse? monthlyData,  DateTime selectedDay,  String selectedDayQuote,  bool isLogged)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.monthlyData,_that.selectedDay,_that.selectedDayQuote,_that.isLogged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MemberMonthlyQuoteResponse? monthlyData,  DateTime selectedDay,  String selectedDayQuote,  bool isLogged)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.monthlyData,_that.selectedDay,_that.selectedDayQuote,_that.isLogged);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState implements CalendarState {
  const _CalendarState({this.monthlyData = null, required this.selectedDay, this.selectedDayQuote = '', this.isLogged = false});
  

@override@JsonKey() final  MemberMonthlyQuoteResponse? monthlyData;
@override final  DateTime selectedDay;
@override@JsonKey() final  String selectedDayQuote;
@override@JsonKey() final  bool isLogged;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&(identical(other.monthlyData, monthlyData) || other.monthlyData == monthlyData)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.selectedDayQuote, selectedDayQuote) || other.selectedDayQuote == selectedDayQuote)&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged));
}


@override
int get hashCode => Object.hash(runtimeType,monthlyData,selectedDay,selectedDayQuote,isLogged);

@override
String toString() {
  return 'CalendarState(monthlyData: $monthlyData, selectedDay: $selectedDay, selectedDayQuote: $selectedDayQuote, isLogged: $isLogged)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 MemberMonthlyQuoteResponse? monthlyData, DateTime selectedDay, String selectedDayQuote, bool isLogged
});




}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthlyData = freezed,Object? selectedDay = null,Object? selectedDayQuote = null,Object? isLogged = null,}) {
  return _then(_CalendarState(
monthlyData: freezed == monthlyData ? _self.monthlyData : monthlyData // ignore: cast_nullable_to_non_nullable
as MemberMonthlyQuoteResponse?,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDayQuote: null == selectedDayQuote ? _self.selectedDayQuote : selectedDayQuote // ignore: cast_nullable_to_non_nullable
as String,isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
