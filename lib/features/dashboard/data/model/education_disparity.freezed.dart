// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_disparity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EducationDisparity {

@JsonKey(name: 'Education Level') String get educationLevel;@JsonKey(name: 'Shortlisted') double get shortlistedRate;
/// Create a copy of EducationDisparity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationDisparityCopyWith<EducationDisparity> get copyWith => _$EducationDisparityCopyWithImpl<EducationDisparity>(this as EducationDisparity, _$identity);

  /// Serializes this EducationDisparity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EducationDisparity&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationLevel,shortlistedRate);

@override
String toString() {
  return 'EducationDisparity(educationLevel: $educationLevel, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class $EducationDisparityCopyWith<$Res>  {
  factory $EducationDisparityCopyWith(EducationDisparity value, $Res Function(EducationDisparity) _then) = _$EducationDisparityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Education Level') String educationLevel,@JsonKey(name: 'Shortlisted') double shortlistedRate
});




}
/// @nodoc
class _$EducationDisparityCopyWithImpl<$Res>
    implements $EducationDisparityCopyWith<$Res> {
  _$EducationDisparityCopyWithImpl(this._self, this._then);

  final EducationDisparity _self;
  final $Res Function(EducationDisparity) _then;

/// Create a copy of EducationDisparity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? educationLevel = null,Object? shortlistedRate = null,}) {
  return _then(_self.copyWith(
educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EducationDisparity].
extension EducationDisparityPatterns on EducationDisparity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EducationDisparity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EducationDisparity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EducationDisparity value)  $default,){
final _that = this;
switch (_that) {
case _EducationDisparity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EducationDisparity value)?  $default,){
final _that = this;
switch (_that) {
case _EducationDisparity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Education Level')  String educationLevel, @JsonKey(name: 'Shortlisted')  double shortlistedRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EducationDisparity() when $default != null:
return $default(_that.educationLevel,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Education Level')  String educationLevel, @JsonKey(name: 'Shortlisted')  double shortlistedRate)  $default,) {final _that = this;
switch (_that) {
case _EducationDisparity():
return $default(_that.educationLevel,_that.shortlistedRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Education Level')  String educationLevel, @JsonKey(name: 'Shortlisted')  double shortlistedRate)?  $default,) {final _that = this;
switch (_that) {
case _EducationDisparity() when $default != null:
return $default(_that.educationLevel,_that.shortlistedRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EducationDisparity implements EducationDisparity {
  const _EducationDisparity({@JsonKey(name: 'Education Level') required this.educationLevel, @JsonKey(name: 'Shortlisted') required this.shortlistedRate});
  factory _EducationDisparity.fromJson(Map<String, dynamic> json) => _$EducationDisparityFromJson(json);

@override@JsonKey(name: 'Education Level') final  String educationLevel;
@override@JsonKey(name: 'Shortlisted') final  double shortlistedRate;

/// Create a copy of EducationDisparity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationDisparityCopyWith<_EducationDisparity> get copyWith => __$EducationDisparityCopyWithImpl<_EducationDisparity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationDisparityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EducationDisparity&&(identical(other.educationLevel, educationLevel) || other.educationLevel == educationLevel)&&(identical(other.shortlistedRate, shortlistedRate) || other.shortlistedRate == shortlistedRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,educationLevel,shortlistedRate);

@override
String toString() {
  return 'EducationDisparity(educationLevel: $educationLevel, shortlistedRate: $shortlistedRate)';
}


}

/// @nodoc
abstract mixin class _$EducationDisparityCopyWith<$Res> implements $EducationDisparityCopyWith<$Res> {
  factory _$EducationDisparityCopyWith(_EducationDisparity value, $Res Function(_EducationDisparity) _then) = __$EducationDisparityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Education Level') String educationLevel,@JsonKey(name: 'Shortlisted') double shortlistedRate
});




}
/// @nodoc
class __$EducationDisparityCopyWithImpl<$Res>
    implements _$EducationDisparityCopyWith<$Res> {
  __$EducationDisparityCopyWithImpl(this._self, this._then);

  final _EducationDisparity _self;
  final $Res Function(_EducationDisparity) _then;

/// Create a copy of EducationDisparity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? educationLevel = null,Object? shortlistedRate = null,}) {
  return _then(_EducationDisparity(
educationLevel: null == educationLevel ? _self.educationLevel : educationLevel // ignore: cast_nullable_to_non_nullable
as String,shortlistedRate: null == shortlistedRate ? _self.shortlistedRate : shortlistedRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
