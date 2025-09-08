// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_quote_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalQuoteInfo {

 int get dailyQuoteSeq; String get korQuote; String get engQuote; String get korAuthor; String get engAuthor; String get korTyping; String get engTyping; String get likeYn; String get memo; String get date; String get dayOfWeek;
/// Create a copy of LocalQuoteInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalQuoteInfoCopyWith<LocalQuoteInfo> get copyWith => _$LocalQuoteInfoCopyWithImpl<LocalQuoteInfo>(this as LocalQuoteInfo, _$identity);

  /// Serializes this LocalQuoteInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalQuoteInfo&&(identical(other.dailyQuoteSeq, dailyQuoteSeq) || other.dailyQuoteSeq == dailyQuoteSeq)&&(identical(other.korQuote, korQuote) || other.korQuote == korQuote)&&(identical(other.engQuote, engQuote) || other.engQuote == engQuote)&&(identical(other.korAuthor, korAuthor) || other.korAuthor == korAuthor)&&(identical(other.engAuthor, engAuthor) || other.engAuthor == engAuthor)&&(identical(other.korTyping, korTyping) || other.korTyping == korTyping)&&(identical(other.engTyping, engTyping) || other.engTyping == engTyping)&&(identical(other.likeYn, likeYn) || other.likeYn == likeYn)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyQuoteSeq,korQuote,engQuote,korAuthor,engAuthor,korTyping,engTyping,likeYn,memo,date,dayOfWeek);

@override
String toString() {
  return 'LocalQuoteInfo(dailyQuoteSeq: $dailyQuoteSeq, korQuote: $korQuote, engQuote: $engQuote, korAuthor: $korAuthor, engAuthor: $engAuthor, korTyping: $korTyping, engTyping: $engTyping, likeYn: $likeYn, memo: $memo, date: $date, dayOfWeek: $dayOfWeek)';
}


}

/// @nodoc
abstract mixin class $LocalQuoteInfoCopyWith<$Res>  {
  factory $LocalQuoteInfoCopyWith(LocalQuoteInfo value, $Res Function(LocalQuoteInfo) _then) = _$LocalQuoteInfoCopyWithImpl;
@useResult
$Res call({
 int dailyQuoteSeq, String korQuote, String engQuote, String korAuthor, String engAuthor, String korTyping, String engTyping, String likeYn, String memo, String date, String dayOfWeek
});




}
/// @nodoc
class _$LocalQuoteInfoCopyWithImpl<$Res>
    implements $LocalQuoteInfoCopyWith<$Res> {
  _$LocalQuoteInfoCopyWithImpl(this._self, this._then);

  final LocalQuoteInfo _self;
  final $Res Function(LocalQuoteInfo) _then;

/// Create a copy of LocalQuoteInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyQuoteSeq = null,Object? korQuote = null,Object? engQuote = null,Object? korAuthor = null,Object? engAuthor = null,Object? korTyping = null,Object? engTyping = null,Object? likeYn = null,Object? memo = null,Object? date = null,Object? dayOfWeek = null,}) {
  return _then(_self.copyWith(
dailyQuoteSeq: null == dailyQuoteSeq ? _self.dailyQuoteSeq : dailyQuoteSeq // ignore: cast_nullable_to_non_nullable
as int,korQuote: null == korQuote ? _self.korQuote : korQuote // ignore: cast_nullable_to_non_nullable
as String,engQuote: null == engQuote ? _self.engQuote : engQuote // ignore: cast_nullable_to_non_nullable
as String,korAuthor: null == korAuthor ? _self.korAuthor : korAuthor // ignore: cast_nullable_to_non_nullable
as String,engAuthor: null == engAuthor ? _self.engAuthor : engAuthor // ignore: cast_nullable_to_non_nullable
as String,korTyping: null == korTyping ? _self.korTyping : korTyping // ignore: cast_nullable_to_non_nullable
as String,engTyping: null == engTyping ? _self.engTyping : engTyping // ignore: cast_nullable_to_non_nullable
as String,likeYn: null == likeYn ? _self.likeYn : likeYn // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalQuoteInfo].
extension LocalQuoteInfoPatterns on LocalQuoteInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalQuoteInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalQuoteInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalQuoteInfo value)  $default,){
final _that = this;
switch (_that) {
case _LocalQuoteInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalQuoteInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LocalQuoteInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dailyQuoteSeq,  String korQuote,  String engQuote,  String korAuthor,  String engAuthor,  String korTyping,  String engTyping,  String likeYn,  String memo,  String date,  String dayOfWeek)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalQuoteInfo() when $default != null:
return $default(_that.dailyQuoteSeq,_that.korQuote,_that.engQuote,_that.korAuthor,_that.engAuthor,_that.korTyping,_that.engTyping,_that.likeYn,_that.memo,_that.date,_that.dayOfWeek);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dailyQuoteSeq,  String korQuote,  String engQuote,  String korAuthor,  String engAuthor,  String korTyping,  String engTyping,  String likeYn,  String memo,  String date,  String dayOfWeek)  $default,) {final _that = this;
switch (_that) {
case _LocalQuoteInfo():
return $default(_that.dailyQuoteSeq,_that.korQuote,_that.engQuote,_that.korAuthor,_that.engAuthor,_that.korTyping,_that.engTyping,_that.likeYn,_that.memo,_that.date,_that.dayOfWeek);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dailyQuoteSeq,  String korQuote,  String engQuote,  String korAuthor,  String engAuthor,  String korTyping,  String engTyping,  String likeYn,  String memo,  String date,  String dayOfWeek)?  $default,) {final _that = this;
switch (_that) {
case _LocalQuoteInfo() when $default != null:
return $default(_that.dailyQuoteSeq,_that.korQuote,_that.engQuote,_that.korAuthor,_that.engAuthor,_that.korTyping,_that.engTyping,_that.likeYn,_that.memo,_that.date,_that.dayOfWeek);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalQuoteInfo extends LocalQuoteInfo {
  const _LocalQuoteInfo({required this.dailyQuoteSeq, required this.korQuote, required this.engQuote, required this.korAuthor, required this.engAuthor, required this.korTyping, required this.engTyping, required this.likeYn, required this.memo, required this.date, required this.dayOfWeek}): super._();
  factory _LocalQuoteInfo.fromJson(Map<String, dynamic> json) => _$LocalQuoteInfoFromJson(json);

@override final  int dailyQuoteSeq;
@override final  String korQuote;
@override final  String engQuote;
@override final  String korAuthor;
@override final  String engAuthor;
@override final  String korTyping;
@override final  String engTyping;
@override final  String likeYn;
@override final  String memo;
@override final  String date;
@override final  String dayOfWeek;

/// Create a copy of LocalQuoteInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalQuoteInfoCopyWith<_LocalQuoteInfo> get copyWith => __$LocalQuoteInfoCopyWithImpl<_LocalQuoteInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalQuoteInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalQuoteInfo&&(identical(other.dailyQuoteSeq, dailyQuoteSeq) || other.dailyQuoteSeq == dailyQuoteSeq)&&(identical(other.korQuote, korQuote) || other.korQuote == korQuote)&&(identical(other.engQuote, engQuote) || other.engQuote == engQuote)&&(identical(other.korAuthor, korAuthor) || other.korAuthor == korAuthor)&&(identical(other.engAuthor, engAuthor) || other.engAuthor == engAuthor)&&(identical(other.korTyping, korTyping) || other.korTyping == korTyping)&&(identical(other.engTyping, engTyping) || other.engTyping == engTyping)&&(identical(other.likeYn, likeYn) || other.likeYn == likeYn)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyQuoteSeq,korQuote,engQuote,korAuthor,engAuthor,korTyping,engTyping,likeYn,memo,date,dayOfWeek);

@override
String toString() {
  return 'LocalQuoteInfo(dailyQuoteSeq: $dailyQuoteSeq, korQuote: $korQuote, engQuote: $engQuote, korAuthor: $korAuthor, engAuthor: $engAuthor, korTyping: $korTyping, engTyping: $engTyping, likeYn: $likeYn, memo: $memo, date: $date, dayOfWeek: $dayOfWeek)';
}


}

/// @nodoc
abstract mixin class _$LocalQuoteInfoCopyWith<$Res> implements $LocalQuoteInfoCopyWith<$Res> {
  factory _$LocalQuoteInfoCopyWith(_LocalQuoteInfo value, $Res Function(_LocalQuoteInfo) _then) = __$LocalQuoteInfoCopyWithImpl;
@override @useResult
$Res call({
 int dailyQuoteSeq, String korQuote, String engQuote, String korAuthor, String engAuthor, String korTyping, String engTyping, String likeYn, String memo, String date, String dayOfWeek
});




}
/// @nodoc
class __$LocalQuoteInfoCopyWithImpl<$Res>
    implements _$LocalQuoteInfoCopyWith<$Res> {
  __$LocalQuoteInfoCopyWithImpl(this._self, this._then);

  final _LocalQuoteInfo _self;
  final $Res Function(_LocalQuoteInfo) _then;

/// Create a copy of LocalQuoteInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyQuoteSeq = null,Object? korQuote = null,Object? engQuote = null,Object? korAuthor = null,Object? engAuthor = null,Object? korTyping = null,Object? engTyping = null,Object? likeYn = null,Object? memo = null,Object? date = null,Object? dayOfWeek = null,}) {
  return _then(_LocalQuoteInfo(
dailyQuoteSeq: null == dailyQuoteSeq ? _self.dailyQuoteSeq : dailyQuoteSeq // ignore: cast_nullable_to_non_nullable
as int,korQuote: null == korQuote ? _self.korQuote : korQuote // ignore: cast_nullable_to_non_nullable
as String,engQuote: null == engQuote ? _self.engQuote : engQuote // ignore: cast_nullable_to_non_nullable
as String,korAuthor: null == korAuthor ? _self.korAuthor : korAuthor // ignore: cast_nullable_to_non_nullable
as String,engAuthor: null == engAuthor ? _self.engAuthor : engAuthor // ignore: cast_nullable_to_non_nullable
as String,korTyping: null == korTyping ? _self.korTyping : korTyping // ignore: cast_nullable_to_non_nullable
as String,engTyping: null == engTyping ? _self.engTyping : engTyping // ignore: cast_nullable_to_non_nullable
as String,likeYn: null == likeYn ? _self.likeYn : likeYn // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
