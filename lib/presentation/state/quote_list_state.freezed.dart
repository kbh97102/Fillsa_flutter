// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuoteListState {

 DateTime get startDate; DateTime get endDate; bool get likeFilter; List<MemberQuotesResponse> get memberQuotes; List<LocalQuoteInfo> get localQuotes; bool get isLogged; bool get isLoading; bool get hasMore; int get currentPage; bool get showCalendar;
/// Create a copy of QuoteListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteListStateCopyWith<QuoteListState> get copyWith => _$QuoteListStateCopyWithImpl<QuoteListState>(this as QuoteListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteListState&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.likeFilter, likeFilter) || other.likeFilter == likeFilter)&&const DeepCollectionEquality().equals(other.memberQuotes, memberQuotes)&&const DeepCollectionEquality().equals(other.localQuotes, localQuotes)&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.showCalendar, showCalendar) || other.showCalendar == showCalendar));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,likeFilter,const DeepCollectionEquality().hash(memberQuotes),const DeepCollectionEquality().hash(localQuotes),isLogged,isLoading,hasMore,currentPage,showCalendar);

@override
String toString() {
  return 'QuoteListState(startDate: $startDate, endDate: $endDate, likeFilter: $likeFilter, memberQuotes: $memberQuotes, localQuotes: $localQuotes, isLogged: $isLogged, isLoading: $isLoading, hasMore: $hasMore, currentPage: $currentPage, showCalendar: $showCalendar)';
}


}

/// @nodoc
abstract mixin class $QuoteListStateCopyWith<$Res>  {
  factory $QuoteListStateCopyWith(QuoteListState value, $Res Function(QuoteListState) _then) = _$QuoteListStateCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate, bool likeFilter, List<MemberQuotesResponse> memberQuotes, List<LocalQuoteInfo> localQuotes, bool isLogged, bool isLoading, bool hasMore, int currentPage, bool showCalendar
});




}
/// @nodoc
class _$QuoteListStateCopyWithImpl<$Res>
    implements $QuoteListStateCopyWith<$Res> {
  _$QuoteListStateCopyWithImpl(this._self, this._then);

  final QuoteListState _self;
  final $Res Function(QuoteListState) _then;

/// Create a copy of QuoteListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? likeFilter = null,Object? memberQuotes = null,Object? localQuotes = null,Object? isLogged = null,Object? isLoading = null,Object? hasMore = null,Object? currentPage = null,Object? showCalendar = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,likeFilter: null == likeFilter ? _self.likeFilter : likeFilter // ignore: cast_nullable_to_non_nullable
as bool,memberQuotes: null == memberQuotes ? _self.memberQuotes : memberQuotes // ignore: cast_nullable_to_non_nullable
as List<MemberQuotesResponse>,localQuotes: null == localQuotes ? _self.localQuotes : localQuotes // ignore: cast_nullable_to_non_nullable
as List<LocalQuoteInfo>,isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,showCalendar: null == showCalendar ? _self.showCalendar : showCalendar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteListState].
extension QuoteListStatePatterns on QuoteListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteListState value)  $default,){
final _that = this;
switch (_that) {
case _QuoteListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteListState value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  bool likeFilter,  List<MemberQuotesResponse> memberQuotes,  List<LocalQuoteInfo> localQuotes,  bool isLogged,  bool isLoading,  bool hasMore,  int currentPage,  bool showCalendar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteListState() when $default != null:
return $default(_that.startDate,_that.endDate,_that.likeFilter,_that.memberQuotes,_that.localQuotes,_that.isLogged,_that.isLoading,_that.hasMore,_that.currentPage,_that.showCalendar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  bool likeFilter,  List<MemberQuotesResponse> memberQuotes,  List<LocalQuoteInfo> localQuotes,  bool isLogged,  bool isLoading,  bool hasMore,  int currentPage,  bool showCalendar)  $default,) {final _that = this;
switch (_that) {
case _QuoteListState():
return $default(_that.startDate,_that.endDate,_that.likeFilter,_that.memberQuotes,_that.localQuotes,_that.isLogged,_that.isLoading,_that.hasMore,_that.currentPage,_that.showCalendar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate,  bool likeFilter,  List<MemberQuotesResponse> memberQuotes,  List<LocalQuoteInfo> localQuotes,  bool isLogged,  bool isLoading,  bool hasMore,  int currentPage,  bool showCalendar)?  $default,) {final _that = this;
switch (_that) {
case _QuoteListState() when $default != null:
return $default(_that.startDate,_that.endDate,_that.likeFilter,_that.memberQuotes,_that.localQuotes,_that.isLogged,_that.isLoading,_that.hasMore,_that.currentPage,_that.showCalendar);case _:
  return null;

}
}

}

/// @nodoc


class _QuoteListState implements QuoteListState {
  const _QuoteListState({required this.startDate, required this.endDate, this.likeFilter = false, final  List<MemberQuotesResponse> memberQuotes = const [], final  List<LocalQuoteInfo> localQuotes = const [], this.isLogged = false, this.isLoading = false, this.hasMore = true, this.currentPage = 0, this.showCalendar = false}): _memberQuotes = memberQuotes,_localQuotes = localQuotes;
  

@override final  DateTime startDate;
@override final  DateTime endDate;
@override@JsonKey() final  bool likeFilter;
 final  List<MemberQuotesResponse> _memberQuotes;
@override@JsonKey() List<MemberQuotesResponse> get memberQuotes {
  if (_memberQuotes is EqualUnmodifiableListView) return _memberQuotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberQuotes);
}

 final  List<LocalQuoteInfo> _localQuotes;
@override@JsonKey() List<LocalQuoteInfo> get localQuotes {
  if (_localQuotes is EqualUnmodifiableListView) return _localQuotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_localQuotes);
}

@override@JsonKey() final  bool isLogged;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool showCalendar;

/// Create a copy of QuoteListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteListStateCopyWith<_QuoteListState> get copyWith => __$QuoteListStateCopyWithImpl<_QuoteListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteListState&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.likeFilter, likeFilter) || other.likeFilter == likeFilter)&&const DeepCollectionEquality().equals(other._memberQuotes, _memberQuotes)&&const DeepCollectionEquality().equals(other._localQuotes, _localQuotes)&&(identical(other.isLogged, isLogged) || other.isLogged == isLogged)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.showCalendar, showCalendar) || other.showCalendar == showCalendar));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,likeFilter,const DeepCollectionEquality().hash(_memberQuotes),const DeepCollectionEquality().hash(_localQuotes),isLogged,isLoading,hasMore,currentPage,showCalendar);

@override
String toString() {
  return 'QuoteListState(startDate: $startDate, endDate: $endDate, likeFilter: $likeFilter, memberQuotes: $memberQuotes, localQuotes: $localQuotes, isLogged: $isLogged, isLoading: $isLoading, hasMore: $hasMore, currentPage: $currentPage, showCalendar: $showCalendar)';
}


}

/// @nodoc
abstract mixin class _$QuoteListStateCopyWith<$Res> implements $QuoteListStateCopyWith<$Res> {
  factory _$QuoteListStateCopyWith(_QuoteListState value, $Res Function(_QuoteListState) _then) = __$QuoteListStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate, bool likeFilter, List<MemberQuotesResponse> memberQuotes, List<LocalQuoteInfo> localQuotes, bool isLogged, bool isLoading, bool hasMore, int currentPage, bool showCalendar
});




}
/// @nodoc
class __$QuoteListStateCopyWithImpl<$Res>
    implements _$QuoteListStateCopyWith<$Res> {
  __$QuoteListStateCopyWithImpl(this._self, this._then);

  final _QuoteListState _self;
  final $Res Function(_QuoteListState) _then;

/// Create a copy of QuoteListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? likeFilter = null,Object? memberQuotes = null,Object? localQuotes = null,Object? isLogged = null,Object? isLoading = null,Object? hasMore = null,Object? currentPage = null,Object? showCalendar = null,}) {
  return _then(_QuoteListState(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,likeFilter: null == likeFilter ? _self.likeFilter : likeFilter // ignore: cast_nullable_to_non_nullable
as bool,memberQuotes: null == memberQuotes ? _self._memberQuotes : memberQuotes // ignore: cast_nullable_to_non_nullable
as List<MemberQuotesResponse>,localQuotes: null == localQuotes ? _self._localQuotes : localQuotes // ignore: cast_nullable_to_non_nullable
as List<LocalQuoteInfo>,isLogged: null == isLogged ? _self.isLogged : isLogged // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,showCalendar: null == showCalendar ? _self.showCalendar : showCalendar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
