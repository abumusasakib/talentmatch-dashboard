// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_disparity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenderDisparity {

@JsonKey(name: 'Gender') String get gender; int get total; int get shortlisted;@JsonKey(name: 'shortlisted_rate') double get shortlistedRate;
/// Create a copy of GenderDisparity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenderDisparityCopyWith<GenderDisparity> get copyWith => _$GenderDisparityCopyWithImpl<GenderDisparity>(this as GenderDisparity, _$identity);

  /// Serializes this GenderDisparity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenderDisparity&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.total, total) || other.total == total)&&(identical(other.shortlisted, shortlisted) || other.shortlisted == shortlisted)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,total,shortlisted,shortlistedRate);

@override
String toString() {
  return 'GenderDisparity(gender: $gender, total: $total, shortlisted: $shortlisted, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class $GenderDisparityCopyWith<$Res>  {
  factory $GenderDisparityCopyWith(GenderDisparity value, $Res Function(GenderDisparity) _then) = _$GenderDisparityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Gender') String gender, int total, int shortlisted,@JsonKey(name: 'shortlisted_rate') double shortlistedRate
});




}
/// @nodoc
class _$GenderDisparityCopyWithImpl<$Res>
    implements $GenderDisparityCopyWith<$Res> {
  _$GenderDisparityCopyWithImpl(this._self, this._then);

  final GenderDisparity _self;
  final $Res Function(GenderDisparity) _then;

/// Create a copy of GenderDisparity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gender = null,Object? total = null,Object? shortlisted = null,Object? shortlistedRate = null,}) {
  return _then(_self.copyWith(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,shortlisted: null == shortlisted ? _self.shortlisted : shortlisted // ignore: cast_nullable_to_non_nullable
as int,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GenderDisparity].
extension GenderDisparityPatterns on GenderDisparity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenderDisparity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenderDisparity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenderDisparity value)  $default,){
final _that = this;
switch (_that) {
case _GenderDisparity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenderDisparity value)?  $default,){
final _that = this;
switch (_that) {
case _GenderDisparity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Gender')  String gender,  int total,  int shortlisted, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenderDisparity() when $default != null:
return $default(_that.gender,_that.total,_that.shortlisted,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Gender')  String gender,  int total,  int shortlisted, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)  $default,) {final _that = this;
switch (_that) {
case _GenderDisparity():
return $default(_that.gender,_that.total,_that.shortlisted,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Gender')  String gender,  int total,  int shortlisted, @JsonKey(name: 'shortlisted_rate')  double shortlistedRate)?  $default,) {final _that = this;
switch (_that) {
case _GenderDisparity() when $default != null:
return $default(_that.gender,_that.total,_that.shortlisted,_that.shortlistedRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenderDisparity implements GenderDisparity {
  const _GenderDisparity({@JsonKey(name: 'Gender') required this.gender, required this.total, required this.shortlisted, @JsonKey(name: 'shortlisted_rate') required this.shortlistedRate});
  factory _GenderDisparity.fromJson(Map<String, dynamic> json) => _$GenderDisparityFromJson(json);

@override@JsonKey(name: 'Gender') final  String gender;
@override final  int total;
@override final  int shortlisted;
@override@JsonKey(name: 'shortlisted_rate') final  double shortlistedRate;

/// Create a copy of GenderDisparity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenderDisparityCopyWith<_GenderDisparity> get copyWith => __$GenderDisparityCopyWithImpl<_GenderDisparity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenderDisparityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenderDisparity&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.total, total) || other.total == total)&&(identical(other.shortlisted, shortlisted) || other.shortlisted == shortlisted)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,total,shortlisted,shortlistedRate);

@override
String toString() {
  return 'GenderDisparity(gender: $gender, total: $total, shortlisted: $shortlisted, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class _$GenderDisparityCopyWith<$Res> implements $GenderDisparityCopyWith<$Res> {
  factory _$GenderDisparityCopyWith(_GenderDisparity value, $Res Function(_GenderDisparity) _then) = __$GenderDisparityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Gender') String gender, int total, int shortlisted,@JsonKey(name: 'shortlisted_rate') double shortlistedRate
});




}
/// @nodoc
class __$GenderDisparityCopyWithImpl<$Res>
    implements _$GenderDisparityCopyWith<$Res> {
  __$GenderDisparityCopyWithImpl(this._self, this._then);

  final _GenderDisparity _self;
  final $Res Function(_GenderDisparity) _then;

/// Create a copy of GenderDisparity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gender = null,Object? total = null,Object? shortlisted = null,Object? shortlistedRate = null,}) {
  return _then(_GenderDisparity(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,shortlisted: null == shortlisted ? _self.shortlisted : shortlisted // ignore: cast_nullable_to_non_nullable
as int,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
