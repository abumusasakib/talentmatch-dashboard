// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_distribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreDistribution {

@JsonKey(name: 'bin_left') double get binLeft;@JsonKey(name: 'bin_right') double get binRight; int get count;
/// Create a copy of ScoreDistribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDistributionCopyWith<ScoreDistribution> get copyWith => _$ScoreDistributionCopyWithImpl<ScoreDistribution>(this as ScoreDistribution, _$identity);

  /// Serializes this ScoreDistribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDistribution&&(identical(other.binLeft, binLeft) || other.binLeft == binLeft)&&(identical(other.binRight, binRight) || other.binRight == binRight)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,binLeft,binRight,count);

@override
String toString() {
  return 'ScoreDistribution(binLeft: $binLeft, binRight: $binRight, count: $count)';
}


}

/// @nodoc
abstract mixin class $ScoreDistributionCopyWith<$Res>  {
  factory $ScoreDistributionCopyWith(ScoreDistribution value, $Res Function(ScoreDistribution) _then) = _$ScoreDistributionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'bin_left') double binLeft,@JsonKey(name: 'bin_right') double binRight, int count
});




}
/// @nodoc
class _$ScoreDistributionCopyWithImpl<$Res>
    implements $ScoreDistributionCopyWith<$Res> {
  _$ScoreDistributionCopyWithImpl(this._self, this._then);

  final ScoreDistribution _self;
  final $Res Function(ScoreDistribution) _then;

/// Create a copy of ScoreDistribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? binLeft = null,Object? binRight = null,Object? count = null,}) {
  return _then(_self.copyWith(
binLeft: null == binLeft ? _self.binLeft : binLeft // ignore: cast_nullable_to_non_nullable
as double,binRight: null == binRight ? _self.binRight : binRight // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreDistribution].
extension ScoreDistributionPatterns on ScoreDistribution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreDistribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreDistribution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreDistribution value)  $default,){
final _that = this;
switch (_that) {
case _ScoreDistribution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreDistribution value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreDistribution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'bin_left')  double binLeft, @JsonKey(name: 'bin_right')  double binRight,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreDistribution() when $default != null:
return $default(_that.binLeft,_that.binRight,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'bin_left')  double binLeft, @JsonKey(name: 'bin_right')  double binRight,  int count)  $default,) {final _that = this;
switch (_that) {
case _ScoreDistribution():
return $default(_that.binLeft,_that.binRight,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'bin_left')  double binLeft, @JsonKey(name: 'bin_right')  double binRight,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ScoreDistribution() when $default != null:
return $default(_that.binLeft,_that.binRight,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreDistribution implements ScoreDistribution {
  const _ScoreDistribution({@JsonKey(name: 'bin_left') required this.binLeft, @JsonKey(name: 'bin_right') required this.binRight, required this.count});
  factory _ScoreDistribution.fromJson(Map<String, dynamic> json) => _$ScoreDistributionFromJson(json);

@override@JsonKey(name: 'bin_left') final  double binLeft;
@override@JsonKey(name: 'bin_right') final  double binRight;
@override final  int count;

/// Create a copy of ScoreDistribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreDistributionCopyWith<_ScoreDistribution> get copyWith => __$ScoreDistributionCopyWithImpl<_ScoreDistribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreDistributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreDistribution&&(identical(other.binLeft, binLeft) || other.binLeft == binLeft)&&(identical(other.binRight, binRight) || other.binRight == binRight)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,binLeft,binRight,count);

@override
String toString() {
  return 'ScoreDistribution(binLeft: $binLeft, binRight: $binRight, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ScoreDistributionCopyWith<$Res> implements $ScoreDistributionCopyWith<$Res> {
  factory _$ScoreDistributionCopyWith(_ScoreDistribution value, $Res Function(_ScoreDistribution) _then) = __$ScoreDistributionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'bin_left') double binLeft,@JsonKey(name: 'bin_right') double binRight, int count
});




}
/// @nodoc
class __$ScoreDistributionCopyWithImpl<$Res>
    implements _$ScoreDistributionCopyWith<$Res> {
  __$ScoreDistributionCopyWithImpl(this._self, this._then);

  final _ScoreDistribution _self;
  final $Res Function(_ScoreDistribution) _then;

/// Create a copy of ScoreDistribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? binLeft = null,Object? binRight = null,Object? count = null,}) {
  return _then(_ScoreDistribution(
binLeft: null == binLeft ? _self.binLeft : binLeft // ignore: cast_nullable_to_non_nullable
as double,binRight: null == binRight ? _self.binRight : binRight // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
