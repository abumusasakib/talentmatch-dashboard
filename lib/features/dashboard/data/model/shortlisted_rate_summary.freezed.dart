// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shortlisted_rate_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ShortlistedRateSummary _$ShortlistedRateSummaryFromJson(
  Map<String, dynamic> json
) {
    return _$ShortlistedRateSummaryImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$ShortlistedRateSummary {

@JsonKey(name: 'total_applications') int get totalApplications;@JsonKey(name: 'shortlisted_count') int get shortlistedCount;@JsonKey(name: 'shortlisted_rate') double get shortlistedRate;
/// Create a copy of ShortlistedRateSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortlistedRateSummaryCopyWith<ShortlistedRateSummary> get copyWith => _$ShortlistedRateSummaryCopyWithImpl<ShortlistedRateSummary>(this as ShortlistedRateSummary, _$identity);

  /// Serializes this ShortlistedRateSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortlistedRateSummary&&(identical(other.totalApplications, totalApplications) || other.totalApplications == totalApplications)&&(identical(other.shortlistedCount, shortlistedCount) || other.shortlistedCount == shortlistedCount)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalApplications,shortlistedCount,shortlistedRate);

@override
String toString() {
  return 'ShortlistedRateSummary(totalApplications: $totalApplications, shortlistedCount: $shortlistedCount, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class $ShortlistedRateSummaryCopyWith<$Res>  {
  factory $ShortlistedRateSummaryCopyWith(ShortlistedRateSummary value, $Res Function(ShortlistedRateSummary) _then) = _$ShortlistedRateSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_applications') int totalApplications,@JsonKey(name: 'shortlisted_count') int shortlistedCount,@JsonKey(name: 'shortlisted_rate') double shortlistedRate
});




}
/// @nodoc
class _$ShortlistedRateSummaryCopyWithImpl<$Res>
    implements $ShortlistedRateSummaryCopyWith<$Res> {
  _$ShortlistedRateSummaryCopyWithImpl(this._self, this._then);

  final ShortlistedRateSummary _self;
  final $Res Function(ShortlistedRateSummary) _then;

/// Create a copy of ShortlistedRateSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalApplications = null,Object? shortlistedCount = null,Object? shortlistedRate = null,}) {
  return _then(_self.copyWith(
totalApplications: null == totalApplications ? _self.totalApplications : totalApplications // ignore: cast_nullable_to_non_nullable
as int,shortlistedCount: null == shortlistedCount ? _self.shortlistedCount : shortlistedCount // ignore: cast_nullable_to_non_nullable
as int,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ShortlistedRateSummary].
extension ShortlistedRateSummaryPatterns on ShortlistedRateSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$ShortlistedRateSummaryImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$ShortlistedRateSummaryImpl value)  $default,){
final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$ShortlistedRateSummaryImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_applications')  int totalApplications, @JsonKey(name: 'shortlisted_count')  int shortlistedCount, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl() when $default != null:
return $default(_that.totalApplications,_that.shortlistedCount,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_applications')  int totalApplications, @JsonKey(name: 'shortlisted_count')  int shortlistedCount, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)  $default,) {final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl():
return $default(_that.totalApplications,_that.shortlistedCount,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_applications')  int totalApplications, @JsonKey(name: 'shortlisted_count')  int shortlistedCount, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)?  $default,) {final _that = this;
switch (_that) {
case _$ShortlistedRateSummaryImpl() when $default != null:
return $default(_that.totalApplications,_that.shortlistedCount,_that.shortlistedRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$ShortlistedRateSummaryImpl implements ShortlistedRateSummary {
  const _$ShortlistedRateSummaryImpl({@JsonKey(name: 'total_applications') required this.totalApplications, @JsonKey(name: 'shortlisted_count') required this.shortlistedCount, @JsonKey(name: 'shortlisted_rate') required this.shortlistedRate});
  factory _$ShortlistedRateSummaryImpl.fromJson(Map<String, dynamic> json) => _$$ShortlistedRateSummaryImplFromJson(json);

@override@JsonKey(name: 'total_applications') final  int totalApplications;
@override@JsonKey(name: 'shortlisted_count') final  int shortlistedCount;
@override@JsonKey(name: 'shortlisted_rate') final  double shortlistedRate;

/// Create a copy of ShortlistedRateSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ShortlistedRateSummaryImplCopyWith<_$ShortlistedRateSummaryImpl> get copyWith => __$$ShortlistedRateSummaryImplCopyWithImpl<_$ShortlistedRateSummaryImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$ShortlistedRateSummaryImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ShortlistedRateSummaryImpl&&(identical(other.totalApplications, totalApplications) || other.totalApplications == totalApplications)&&(identical(other.shortlistedCount, shortlistedCount) || other.shortlistedCount == shortlistedCount)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalApplications,shortlistedCount,shortlistedRate);

@override
String toString() {
  return 'ShortlistedRateSummary(totalApplications: $totalApplications, shortlistedCount: $shortlistedCount, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class _$$ShortlistedRateSummaryImplCopyWith<$Res> implements $ShortlistedRateSummaryCopyWith<$Res> {
  factory _$$ShortlistedRateSummaryImplCopyWith(_$ShortlistedRateSummaryImpl value, $Res Function(_$ShortlistedRateSummaryImpl) _then) = __$$ShortlistedRateSummaryImplCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_applications') int totalApplications,@JsonKey(name: 'shortlisted_count') int shortlistedCount,@JsonKey(name: 'shortlisted_rate') double shortlistedRate
});




}
/// @nodoc
class __$$ShortlistedRateSummaryImplCopyWithImpl<$Res>
    implements _$$ShortlistedRateSummaryImplCopyWith<$Res> {
  __$$ShortlistedRateSummaryImplCopyWithImpl(this._self, this._then);

  final _$ShortlistedRateSummaryImpl _self;
  final $Res Function(_$ShortlistedRateSummaryImpl) _then;

/// Create a copy of ShortlistedRateSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalApplications = null,Object? shortlistedCount = null,Object? shortlistedRate = null,}) {
  return _then(_$ShortlistedRateSummaryImpl(
totalApplications: null == totalApplications ? _self.totalApplications : totalApplications // ignore: cast_nullable_to_non_nullable
as int,shortlistedCount: null == shortlistedCount ? _self.shortlistedCount : shortlistedCount // ignore: cast_nullable_to_non_nullable
as int,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
