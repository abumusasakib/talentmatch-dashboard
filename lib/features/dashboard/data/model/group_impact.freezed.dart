// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_impact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GroupImpact _$GroupImpactFromJson(
  Map<String, dynamic> json
) {
    return _$GroupImpactImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$GroupImpact {

@JsonKey(name: 'group_col') String get groupCol; String get group;@JsonKey(name: 'n_candidates') int get nCandidates;@JsonKey(name: 'affected_count') int get affectedCount;@JsonKey(name: 'additional_shortlisted') int get additionalShortlisted;@JsonKey(name: 'removed_shortlisted') int get removedShortlisted;@JsonKey(name: 'fp_change') double get fpChange;@JsonKey(name: 'recommended_action') String get recommendedAction; String get alert;
/// Create a copy of GroupImpact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupImpactCopyWith<GroupImpact> get copyWith => _$GroupImpactCopyWithImpl<GroupImpact>(this as GroupImpact, _$identity);

  /// Serializes this GroupImpact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupImpact&&(identical(other.groupCol, groupCol) || other.groupCol == groupCol)&&(identical(other.group, group) || other.group == group)&&(identical(other.nCandidates, nCandidates) || other.nCandidates == nCandidates)&&(identical(other.affectedCount, affectedCount) || other.affectedCount == affectedCount)&&(identical(other.additionalShortlisted, additionalShortlisted) || other.additionalShortlisted == additionalShortlisted)&&(identical(other.removedShortlisted, removedShortlisted) || other.removedShortlisted == removedShortlisted)&&(identical(other.fpChange, fpChange) || other.fpChange == fpChange)&&(identical(other.recommendedAction, recommendedAction) || other.recommendedAction == recommendedAction)&&(identical(other.alert, alert) || other.alert == alert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupCol,group,nCandidates,affectedCount,additionalShortlisted,removedShortlisted,fpChange,recommendedAction,alert);

@override
String toString() {
  return 'GroupImpact(groupCol: $groupCol, group: $group, nCandidates: $nCandidates, affectedCount: $affectedCount, additionalShortlisted: $additionalShortlisted, removedShortlisted: $removedShortlisted, fpChange: $fpChange, recommendedAction: $recommendedAction, alert: $alert)';
}


}

/// @nodoc
abstract mixin class $GroupImpactCopyWith<$Res>  {
  factory $GroupImpactCopyWith(GroupImpact value, $Res Function(GroupImpact) _then) = _$GroupImpactCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_col') String groupCol, String group,@JsonKey(name: 'n_candidates') int nCandidates,@JsonKey(name: 'affected_count') int affectedCount,@JsonKey(name: 'additional_shortlisted') int additionalShortlisted,@JsonKey(name: 'removed_shortlisted') int removedShortlisted,@JsonKey(name: 'fp_change') double fpChange,@JsonKey(name: 'recommended_action') String recommendedAction, String alert
});




}
/// @nodoc
class _$GroupImpactCopyWithImpl<$Res>
    implements $GroupImpactCopyWith<$Res> {
  _$GroupImpactCopyWithImpl(this._self, this._then);

  final GroupImpact _self;
  final $Res Function(GroupImpact) _then;

/// Create a copy of GroupImpact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupCol = null,Object? group = null,Object? nCandidates = null,Object? affectedCount = null,Object? additionalShortlisted = null,Object? removedShortlisted = null,Object? fpChange = null,Object? recommendedAction = null,Object? alert = null,}) {
  return _then(_self.copyWith(
groupCol: null == groupCol ? _self.groupCol : groupCol // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,nCandidates: null == nCandidates ? _self.nCandidates : nCandidates // ignore: cast_nullable_to_non_nullable
as int,affectedCount: null == affectedCount ? _self.affectedCount : affectedCount // ignore: cast_nullable_to_non_nullable
as int,additionalShortlisted: null == additionalShortlisted ? _self.additionalShortlisted : additionalShortlisted // ignore: cast_nullable_to_non_nullable
as int,removedShortlisted: null == removedShortlisted ? _self.removedShortlisted : removedShortlisted // ignore: cast_nullable_to_non_nullable
as int,fpChange: null == fpChange ? _self.fpChange : fpChange // ignore: cast_nullable_to_non_nullable
as double,recommendedAction: null == recommendedAction ? _self.recommendedAction : recommendedAction // ignore: cast_nullable_to_non_nullable
as String,alert: null == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupImpact].
extension GroupImpactPatterns on GroupImpact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$GroupImpactImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$GroupImpactImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$GroupImpactImpl value)  $default,){
final _that = this;
switch (_that) {
case _$GroupImpactImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$GroupImpactImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$GroupImpactImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_col')  String groupCol,  String group, @JsonKey(name: 'n_candidates')  int nCandidates, @JsonKey(name: 'affected_count')  int affectedCount, @JsonKey(name: 'additional_shortlisted')  int additionalShortlisted, @JsonKey(name: 'removed_shortlisted')  int removedShortlisted, @JsonKey(name: 'fp_change')  double fpChange, @JsonKey(name: 'recommended_action')  String recommendedAction,  String alert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$GroupImpactImpl() when $default != null:
return $default(_that.groupCol,_that.group,_that.nCandidates,_that.affectedCount,_that.additionalShortlisted,_that.removedShortlisted,_that.fpChange,_that.recommendedAction,_that.alert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_col')  String groupCol,  String group, @JsonKey(name: 'n_candidates')  int nCandidates, @JsonKey(name: 'affected_count')  int affectedCount, @JsonKey(name: 'additional_shortlisted')  int additionalShortlisted, @JsonKey(name: 'removed_shortlisted')  int removedShortlisted, @JsonKey(name: 'fp_change')  double fpChange, @JsonKey(name: 'recommended_action')  String recommendedAction,  String alert)  $default,) {final _that = this;
switch (_that) {
case _$GroupImpactImpl():
return $default(_that.groupCol,_that.group,_that.nCandidates,_that.affectedCount,_that.additionalShortlisted,_that.removedShortlisted,_that.fpChange,_that.recommendedAction,_that.alert);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_col')  String groupCol,  String group, @JsonKey(name: 'n_candidates')  int nCandidates, @JsonKey(name: 'affected_count')  int affectedCount, @JsonKey(name: 'additional_shortlisted')  int additionalShortlisted, @JsonKey(name: 'removed_shortlisted')  int removedShortlisted, @JsonKey(name: 'fp_change')  double fpChange, @JsonKey(name: 'recommended_action')  String recommendedAction,  String alert)?  $default,) {final _that = this;
switch (_that) {
case _$GroupImpactImpl() when $default != null:
return $default(_that.groupCol,_that.group,_that.nCandidates,_that.affectedCount,_that.additionalShortlisted,_that.removedShortlisted,_that.fpChange,_that.recommendedAction,_that.alert);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$GroupImpactImpl implements GroupImpact {
  const _$GroupImpactImpl({@JsonKey(name: 'group_col') required this.groupCol, required this.group, @JsonKey(name: 'n_candidates') required this.nCandidates, @JsonKey(name: 'affected_count') required this.affectedCount, @JsonKey(name: 'additional_shortlisted') required this.additionalShortlisted, @JsonKey(name: 'removed_shortlisted') required this.removedShortlisted, @JsonKey(name: 'fp_change') required this.fpChange, @JsonKey(name: 'recommended_action') required this.recommendedAction, required this.alert});
  factory _$GroupImpactImpl.fromJson(Map<String, dynamic> json) => _$$GroupImpactImplFromJson(json);

@override@JsonKey(name: 'group_col') final  String groupCol;
@override final  String group;
@override@JsonKey(name: 'n_candidates') final  int nCandidates;
@override@JsonKey(name: 'affected_count') final  int affectedCount;
@override@JsonKey(name: 'additional_shortlisted') final  int additionalShortlisted;
@override@JsonKey(name: 'removed_shortlisted') final  int removedShortlisted;
@override@JsonKey(name: 'fp_change') final  double fpChange;
@override@JsonKey(name: 'recommended_action') final  String recommendedAction;
@override final  String alert;

/// Create a copy of GroupImpact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$GroupImpactImplCopyWith<_$GroupImpactImpl> get copyWith => __$$GroupImpactImplCopyWithImpl<_$GroupImpactImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$GroupImpactImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$GroupImpactImpl&&(identical(other.groupCol, groupCol) || other.groupCol == groupCol)&&(identical(other.group, group) || other.group == group)&&(identical(other.nCandidates, nCandidates) || other.nCandidates == nCandidates)&&(identical(other.affectedCount, affectedCount) || other.affectedCount == affectedCount)&&(identical(other.additionalShortlisted, additionalShortlisted) || other.additionalShortlisted == additionalShortlisted)&&(identical(other.removedShortlisted, removedShortlisted) || other.removedShortlisted == removedShortlisted)&&(identical(other.fpChange, fpChange) || other.fpChange == fpChange)&&(identical(other.recommendedAction, recommendedAction) || other.recommendedAction == recommendedAction)&&(identical(other.alert, alert) || other.alert == alert));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupCol,group,nCandidates,affectedCount,additionalShortlisted,removedShortlisted,fpChange,recommendedAction,alert);

@override
String toString() {
  return 'GroupImpact(groupCol: $groupCol, group: $group, nCandidates: $nCandidates, affectedCount: $affectedCount, additionalShortlisted: $additionalShortlisted, removedShortlisted: $removedShortlisted, fpChange: $fpChange, recommendedAction: $recommendedAction, alert: $alert)';
}


}

/// @nodoc
abstract mixin class _$$GroupImpactImplCopyWith<$Res> implements $GroupImpactCopyWith<$Res> {
  factory _$$GroupImpactImplCopyWith(_$GroupImpactImpl value, $Res Function(_$GroupImpactImpl) _then) = __$$GroupImpactImplCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_col') String groupCol, String group,@JsonKey(name: 'n_candidates') int nCandidates,@JsonKey(name: 'affected_count') int affectedCount,@JsonKey(name: 'additional_shortlisted') int additionalShortlisted,@JsonKey(name: 'removed_shortlisted') int removedShortlisted,@JsonKey(name: 'fp_change') double fpChange,@JsonKey(name: 'recommended_action') String recommendedAction, String alert
});




}
/// @nodoc
class __$$GroupImpactImplCopyWithImpl<$Res>
    implements _$$GroupImpactImplCopyWith<$Res> {
  __$$GroupImpactImplCopyWithImpl(this._self, this._then);

  final _$GroupImpactImpl _self;
  final $Res Function(_$GroupImpactImpl) _then;

/// Create a copy of GroupImpact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupCol = null,Object? group = null,Object? nCandidates = null,Object? affectedCount = null,Object? additionalShortlisted = null,Object? removedShortlisted = null,Object? fpChange = null,Object? recommendedAction = null,Object? alert = null,}) {
  return _then(_$GroupImpactImpl(
groupCol: null == groupCol ? _self.groupCol : groupCol // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,nCandidates: null == nCandidates ? _self.nCandidates : nCandidates // ignore: cast_nullable_to_non_nullable
as int,affectedCount: null == affectedCount ? _self.affectedCount : affectedCount // ignore: cast_nullable_to_non_nullable
as int,additionalShortlisted: null == additionalShortlisted ? _self.additionalShortlisted : additionalShortlisted // ignore: cast_nullable_to_non_nullable
as int,removedShortlisted: null == removedShortlisted ? _self.removedShortlisted : removedShortlisted // ignore: cast_nullable_to_non_nullable
as int,fpChange: null == fpChange ? _self.fpChange : fpChange // ignore: cast_nullable_to_non_nullable
as double,recommendedAction: null == recommendedAction ? _self.recommendedAction : recommendedAction // ignore: cast_nullable_to_non_nullable
as String,alert: null == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
