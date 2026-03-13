// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_thresholding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GroupThresholding _$GroupThresholdingFromJson(
  Map<String, dynamic> json
) {
    return _$GroupThresholdingImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$GroupThresholding {

@JsonKey(name: 'target_recall') double get targetRecall;@JsonKey(name: 'operational_threshold') double get operationalThreshold;@JsonKey(name: 'generated_at') String get generatedAt;
/// Create a copy of GroupThresholding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupThresholdingCopyWith<GroupThresholding> get copyWith => _$GroupThresholdingCopyWithImpl<GroupThresholding>(this as GroupThresholding, _$identity);

  /// Serializes this GroupThresholding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupThresholding&&(identical(other.targetRecall, targetRecall) || other.targetRecall == targetRecall)&&(identical(other.operationalThreshold, operationalThreshold) || other.operationalThreshold == operationalThreshold)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetRecall,operationalThreshold,generatedAt);

@override
String toString() {
  return 'GroupThresholding(targetRecall: $targetRecall, operationalThreshold: $operationalThreshold, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class $GroupThresholdingCopyWith<$Res>  {
  factory $GroupThresholdingCopyWith(GroupThresholding value, $Res Function(GroupThresholding) _then) = _$GroupThresholdingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'target_recall') double targetRecall,@JsonKey(name: 'operational_threshold') double operationalThreshold,@JsonKey(name: 'generated_at') String generatedAt
});




}
/// @nodoc
class _$GroupThresholdingCopyWithImpl<$Res>
    implements $GroupThresholdingCopyWith<$Res> {
  _$GroupThresholdingCopyWithImpl(this._self, this._then);

  final GroupThresholding _self;
  final $Res Function(GroupThresholding) _then;

/// Create a copy of GroupThresholding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetRecall = null,Object? operationalThreshold = null,Object? generatedAt = null,}) {
  return _then(_self.copyWith(
targetRecall: null == targetRecall ? _self.targetRecall : targetRecall // ignore: cast_nullable_to_non_nullable
as double,operationalThreshold: null == operationalThreshold ? _self.operationalThreshold : operationalThreshold // ignore: cast_nullable_to_non_nullable
as double,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupThresholding].
extension GroupThresholdingPatterns on GroupThresholding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$GroupThresholdingImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$GroupThresholdingImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$GroupThresholdingImpl value)  $default,){
final _that = this;
switch (_that) {
case _$GroupThresholdingImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$GroupThresholdingImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$GroupThresholdingImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'generated_at')  String generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$GroupThresholdingImpl() when $default != null:
return $default(_that.targetRecall,_that.operationalThreshold,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'generated_at')  String generatedAt)  $default,) {final _that = this;
switch (_that) {
case _$GroupThresholdingImpl():
return $default(_that.targetRecall,_that.operationalThreshold,_that.generatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'generated_at')  String generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _$GroupThresholdingImpl() when $default != null:
return $default(_that.targetRecall,_that.operationalThreshold,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$GroupThresholdingImpl implements GroupThresholding {
  const _$GroupThresholdingImpl({@JsonKey(name: 'target_recall') required this.targetRecall, @JsonKey(name: 'operational_threshold') required this.operationalThreshold, @JsonKey(name: 'generated_at') required this.generatedAt});
  factory _$GroupThresholdingImpl.fromJson(Map<String, dynamic> json) => _$$GroupThresholdingImplFromJson(json);

@override@JsonKey(name: 'target_recall') final  double targetRecall;
@override@JsonKey(name: 'operational_threshold') final  double operationalThreshold;
@override@JsonKey(name: 'generated_at') final  String generatedAt;

/// Create a copy of GroupThresholding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$GroupThresholdingImplCopyWith<_$GroupThresholdingImpl> get copyWith => __$$GroupThresholdingImplCopyWithImpl<_$GroupThresholdingImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$GroupThresholdingImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$GroupThresholdingImpl&&(identical(other.targetRecall, targetRecall) || other.targetRecall == targetRecall)&&(identical(other.operationalThreshold, operationalThreshold) || other.operationalThreshold == operationalThreshold)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetRecall,operationalThreshold,generatedAt);

@override
String toString() {
  return 'GroupThresholding(targetRecall: $targetRecall, operationalThreshold: $operationalThreshold, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$$GroupThresholdingImplCopyWith<$Res> implements $GroupThresholdingCopyWith<$Res> {
  factory _$$GroupThresholdingImplCopyWith(_$GroupThresholdingImpl value, $Res Function(_$GroupThresholdingImpl) _then) = __$$GroupThresholdingImplCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'target_recall') double targetRecall,@JsonKey(name: 'operational_threshold') double operationalThreshold,@JsonKey(name: 'generated_at') String generatedAt
});




}
/// @nodoc
class __$$GroupThresholdingImplCopyWithImpl<$Res>
    implements _$$GroupThresholdingImplCopyWith<$Res> {
  __$$GroupThresholdingImplCopyWithImpl(this._self, this._then);

  final _$GroupThresholdingImpl _self;
  final $Res Function(_$GroupThresholdingImpl) _then;

/// Create a copy of GroupThresholding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetRecall = null,Object? operationalThreshold = null,Object? generatedAt = null,}) {
  return _then(_$GroupThresholdingImpl(
targetRecall: null == targetRecall ? _self.targetRecall : targetRecall // ignore: cast_nullable_to_non_nullable
as double,operationalThreshold: null == operationalThreshold ? _self.operationalThreshold : operationalThreshold // ignore: cast_nullable_to_non_nullable
as double,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
