// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overall_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
OverallStats _$OverallStatsFromJson(
  Map<String, dynamic> json
) {
    return _$OverallStatsImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$OverallStats {

@JsonKey(name: 'run_utc') String get runUtc;@JsonKey(name: 'target_recall') double get targetRecall;@JsonKey(name: 'operational_threshold') double get operationalThreshold;@JsonKey(name: 'n_total_candidates') int get nTotalCandidates;@JsonKey(name: 'n_candidates_affected') int get nCandidatesAffected;@JsonKey(name: 'n_additional_shortlisted') int get nAdditionalShortlisted;@JsonKey(name: 'n_removed_shortlisted') int get nRemovedShortlisted;@JsonKey(name: 'groups_with_alerts_count') int get groupsWithAlertsCount;@JsonKey(name: 'recommended_overall_action') String get recommendedOverallAction;
/// Create a copy of OverallStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverallStatsCopyWith<OverallStats> get copyWith => _$OverallStatsCopyWithImpl<OverallStats>(this as OverallStats, _$identity);

  /// Serializes this OverallStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverallStats&&(identical(other.runUtc, runUtc) || other.runUtc == runUtc)&&(identical(other.targetRecall, targetRecall) || other.targetRecall == targetRecall)&&(identical(other.operationalThreshold, operationalThreshold) || other.operationalThreshold == operationalThreshold)&&(identical(other.nTotalCandidates, nTotalCandidates) || other.nTotalCandidates == nTotalCandidates)&&(identical(other.nCandidatesAffected, nCandidatesAffected) || other.nCandidatesAffected == nCandidatesAffected)&&(identical(other.nAdditionalShortlisted, nAdditionalShortlisted) || other.nAdditionalShortlisted == nAdditionalShortlisted)&&(identical(other.nRemovedShortlisted, nRemovedShortlisted) || other.nRemovedShortlisted == nRemovedShortlisted)&&(identical(other.groupsWithAlertsCount, groupsWithAlertsCount) || other.groupsWithAlertsCount == groupsWithAlertsCount)&&(identical(other.recommendedOverallAction, recommendedOverallAction) || other.recommendedOverallAction == recommendedOverallAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,runUtc,targetRecall,operationalThreshold,nTotalCandidates,nCandidatesAffected,nAdditionalShortlisted,nRemovedShortlisted,groupsWithAlertsCount,recommendedOverallAction);

@override
String toString() {
  return 'OverallStats(runUtc: $runUtc, targetRecall: $targetRecall, operationalThreshold: $operationalThreshold, nTotalCandidates: $nTotalCandidates, nCandidatesAffected: $nCandidatesAffected, nAdditionalShortlisted: $nAdditionalShortlisted, nRemovedShortlisted: $nRemovedShortlisted, groupsWithAlertsCount: $groupsWithAlertsCount, recommendedOverallAction: $recommendedOverallAction)';
}


}

/// @nodoc
abstract mixin class $OverallStatsCopyWith<$Res>  {
  factory $OverallStatsCopyWith(OverallStats value, $Res Function(OverallStats) _then) = _$OverallStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'run_utc') String runUtc,@JsonKey(name: 'target_recall') double targetRecall,@JsonKey(name: 'operational_threshold') double operationalThreshold,@JsonKey(name: 'n_total_candidates') int nTotalCandidates,@JsonKey(name: 'n_candidates_affected') int nCandidatesAffected,@JsonKey(name: 'n_additional_shortlisted') int nAdditionalShortlisted,@JsonKey(name: 'n_removed_shortlisted') int nRemovedShortlisted,@JsonKey(name: 'groups_with_alerts_count') int groupsWithAlertsCount,@JsonKey(name: 'recommended_overall_action') String recommendedOverallAction
});




}
/// @nodoc
class _$OverallStatsCopyWithImpl<$Res>
    implements $OverallStatsCopyWith<$Res> {
  _$OverallStatsCopyWithImpl(this._self, this._then);

  final OverallStats _self;
  final $Res Function(OverallStats) _then;

/// Create a copy of OverallStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? runUtc = null,Object? targetRecall = null,Object? operationalThreshold = null,Object? nTotalCandidates = null,Object? nCandidatesAffected = null,Object? nAdditionalShortlisted = null,Object? nRemovedShortlisted = null,Object? groupsWithAlertsCount = null,Object? recommendedOverallAction = null,}) {
  return _then(_self.copyWith(
runUtc: null == runUtc ? _self.runUtc : runUtc // ignore: cast_nullable_to_non_nullable
as String,targetRecall: null == targetRecall ? _self.targetRecall : targetRecall // ignore: cast_nullable_to_non_nullable
as double,operationalThreshold: null == operationalThreshold ? _self.operationalThreshold : operationalThreshold // ignore: cast_nullable_to_non_nullable
as double,nTotalCandidates: null == nTotalCandidates ? _self.nTotalCandidates : nTotalCandidates // ignore: cast_nullable_to_non_nullable
as int,nCandidatesAffected: null == nCandidatesAffected ? _self.nCandidatesAffected : nCandidatesAffected // ignore: cast_nullable_to_non_nullable
as int,nAdditionalShortlisted: null == nAdditionalShortlisted ? _self.nAdditionalShortlisted : nAdditionalShortlisted // ignore: cast_nullable_to_non_nullable
as int,nRemovedShortlisted: null == nRemovedShortlisted ? _self.nRemovedShortlisted : nRemovedShortlisted // ignore: cast_nullable_to_non_nullable
as int,groupsWithAlertsCount: null == groupsWithAlertsCount ? _self.groupsWithAlertsCount : groupsWithAlertsCount // ignore: cast_nullable_to_non_nullable
as int,recommendedOverallAction: null == recommendedOverallAction ? _self.recommendedOverallAction : recommendedOverallAction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OverallStats].
extension OverallStatsPatterns on OverallStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$OverallStatsImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$OverallStatsImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$OverallStatsImpl value)  $default,){
final _that = this;
switch (_that) {
case _$OverallStatsImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$OverallStatsImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$OverallStatsImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'run_utc')  String runUtc, @JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'n_total_candidates')  int nTotalCandidates, @JsonKey(name: 'n_candidates_affected')  int nCandidatesAffected, @JsonKey(name: 'n_additional_shortlisted')  int nAdditionalShortlisted, @JsonKey(name: 'n_removed_shortlisted')  int nRemovedShortlisted, @JsonKey(name: 'groups_with_alerts_count')  int groupsWithAlertsCount, @JsonKey(name: 'recommended_overall_action')  String recommendedOverallAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$OverallStatsImpl() when $default != null:
return $default(_that.runUtc,_that.targetRecall,_that.operationalThreshold,_that.nTotalCandidates,_that.nCandidatesAffected,_that.nAdditionalShortlisted,_that.nRemovedShortlisted,_that.groupsWithAlertsCount,_that.recommendedOverallAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'run_utc')  String runUtc, @JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'n_total_candidates')  int nTotalCandidates, @JsonKey(name: 'n_candidates_affected')  int nCandidatesAffected, @JsonKey(name: 'n_additional_shortlisted')  int nAdditionalShortlisted, @JsonKey(name: 'n_removed_shortlisted')  int nRemovedShortlisted, @JsonKey(name: 'groups_with_alerts_count')  int groupsWithAlertsCount, @JsonKey(name: 'recommended_overall_action')  String recommendedOverallAction)  $default,) {final _that = this;
switch (_that) {
case _$OverallStatsImpl():
return $default(_that.runUtc,_that.targetRecall,_that.operationalThreshold,_that.nTotalCandidates,_that.nCandidatesAffected,_that.nAdditionalShortlisted,_that.nRemovedShortlisted,_that.groupsWithAlertsCount,_that.recommendedOverallAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'run_utc')  String runUtc, @JsonKey(name: 'target_recall')  double targetRecall, @JsonKey(name: 'operational_threshold')  double operationalThreshold, @JsonKey(name: 'n_total_candidates')  int nTotalCandidates, @JsonKey(name: 'n_candidates_affected')  int nCandidatesAffected, @JsonKey(name: 'n_additional_shortlisted')  int nAdditionalShortlisted, @JsonKey(name: 'n_removed_shortlisted')  int nRemovedShortlisted, @JsonKey(name: 'groups_with_alerts_count')  int groupsWithAlertsCount, @JsonKey(name: 'recommended_overall_action')  String recommendedOverallAction)?  $default,) {final _that = this;
switch (_that) {
case _$OverallStatsImpl() when $default != null:
return $default(_that.runUtc,_that.targetRecall,_that.operationalThreshold,_that.nTotalCandidates,_that.nCandidatesAffected,_that.nAdditionalShortlisted,_that.nRemovedShortlisted,_that.groupsWithAlertsCount,_that.recommendedOverallAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$OverallStatsImpl implements OverallStats {
  const _$OverallStatsImpl({@JsonKey(name: 'run_utc') required this.runUtc, @JsonKey(name: 'target_recall') required this.targetRecall, @JsonKey(name: 'operational_threshold') required this.operationalThreshold, @JsonKey(name: 'n_total_candidates') required this.nTotalCandidates, @JsonKey(name: 'n_candidates_affected') required this.nCandidatesAffected, @JsonKey(name: 'n_additional_shortlisted') required this.nAdditionalShortlisted, @JsonKey(name: 'n_removed_shortlisted') required this.nRemovedShortlisted, @JsonKey(name: 'groups_with_alerts_count') required this.groupsWithAlertsCount, @JsonKey(name: 'recommended_overall_action') required this.recommendedOverallAction});
  factory _$OverallStatsImpl.fromJson(Map<String, dynamic> json) => _$$OverallStatsImplFromJson(json);

@override@JsonKey(name: 'run_utc') final  String runUtc;
@override@JsonKey(name: 'target_recall') final  double targetRecall;
@override@JsonKey(name: 'operational_threshold') final  double operationalThreshold;
@override@JsonKey(name: 'n_total_candidates') final  int nTotalCandidates;
@override@JsonKey(name: 'n_candidates_affected') final  int nCandidatesAffected;
@override@JsonKey(name: 'n_additional_shortlisted') final  int nAdditionalShortlisted;
@override@JsonKey(name: 'n_removed_shortlisted') final  int nRemovedShortlisted;
@override@JsonKey(name: 'groups_with_alerts_count') final  int groupsWithAlertsCount;
@override@JsonKey(name: 'recommended_overall_action') final  String recommendedOverallAction;

/// Create a copy of OverallStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$OverallStatsImplCopyWith<_$OverallStatsImpl> get copyWith => __$$OverallStatsImplCopyWithImpl<_$OverallStatsImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$OverallStatsImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$OverallStatsImpl&&(identical(other.runUtc, runUtc) || other.runUtc == runUtc)&&(identical(other.targetRecall, targetRecall) || other.targetRecall == targetRecall)&&(identical(other.operationalThreshold, operationalThreshold) || other.operationalThreshold == operationalThreshold)&&(identical(other.nTotalCandidates, nTotalCandidates) || other.nTotalCandidates == nTotalCandidates)&&(identical(other.nCandidatesAffected, nCandidatesAffected) || other.nCandidatesAffected == nCandidatesAffected)&&(identical(other.nAdditionalShortlisted, nAdditionalShortlisted) || other.nAdditionalShortlisted == nAdditionalShortlisted)&&(identical(other.nRemovedShortlisted, nRemovedShortlisted) || other.nRemovedShortlisted == nRemovedShortlisted)&&(identical(other.groupsWithAlertsCount, groupsWithAlertsCount) || other.groupsWithAlertsCount == groupsWithAlertsCount)&&(identical(other.recommendedOverallAction, recommendedOverallAction) || other.recommendedOverallAction == recommendedOverallAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,runUtc,targetRecall,operationalThreshold,nTotalCandidates,nCandidatesAffected,nAdditionalShortlisted,nRemovedShortlisted,groupsWithAlertsCount,recommendedOverallAction);

@override
String toString() {
  return 'OverallStats(runUtc: $runUtc, targetRecall: $targetRecall, operationalThreshold: $operationalThreshold, nTotalCandidates: $nTotalCandidates, nCandidatesAffected: $nCandidatesAffected, nAdditionalShortlisted: $nAdditionalShortlisted, nRemovedShortlisted: $nRemovedShortlisted, groupsWithAlertsCount: $groupsWithAlertsCount, recommendedOverallAction: $recommendedOverallAction)';
}


}

/// @nodoc
abstract mixin class _$$OverallStatsImplCopyWith<$Res> implements $OverallStatsCopyWith<$Res> {
  factory _$$OverallStatsImplCopyWith(_$OverallStatsImpl value, $Res Function(_$OverallStatsImpl) _then) = __$$OverallStatsImplCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'run_utc') String runUtc,@JsonKey(name: 'target_recall') double targetRecall,@JsonKey(name: 'operational_threshold') double operationalThreshold,@JsonKey(name: 'n_total_candidates') int nTotalCandidates,@JsonKey(name: 'n_candidates_affected') int nCandidatesAffected,@JsonKey(name: 'n_additional_shortlisted') int nAdditionalShortlisted,@JsonKey(name: 'n_removed_shortlisted') int nRemovedShortlisted,@JsonKey(name: 'groups_with_alerts_count') int groupsWithAlertsCount,@JsonKey(name: 'recommended_overall_action') String recommendedOverallAction
});




}
/// @nodoc
class __$$OverallStatsImplCopyWithImpl<$Res>
    implements _$$OverallStatsImplCopyWith<$Res> {
  __$$OverallStatsImplCopyWithImpl(this._self, this._then);

  final _$OverallStatsImpl _self;
  final $Res Function(_$OverallStatsImpl) _then;

/// Create a copy of OverallStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? runUtc = null,Object? targetRecall = null,Object? operationalThreshold = null,Object? nTotalCandidates = null,Object? nCandidatesAffected = null,Object? nAdditionalShortlisted = null,Object? nRemovedShortlisted = null,Object? groupsWithAlertsCount = null,Object? recommendedOverallAction = null,}) {
  return _then(_$OverallStatsImpl(
runUtc: null == runUtc ? _self.runUtc : runUtc // ignore: cast_nullable_to_non_nullable
as String,targetRecall: null == targetRecall ? _self.targetRecall : targetRecall // ignore: cast_nullable_to_non_nullable
as double,operationalThreshold: null == operationalThreshold ? _self.operationalThreshold : operationalThreshold // ignore: cast_nullable_to_non_nullable
as double,nTotalCandidates: null == nTotalCandidates ? _self.nTotalCandidates : nTotalCandidates // ignore: cast_nullable_to_non_nullable
as int,nCandidatesAffected: null == nCandidatesAffected ? _self.nCandidatesAffected : nCandidatesAffected // ignore: cast_nullable_to_non_nullable
as int,nAdditionalShortlisted: null == nAdditionalShortlisted ? _self.nAdditionalShortlisted : nAdditionalShortlisted // ignore: cast_nullable_to_non_nullable
as int,nRemovedShortlisted: null == nRemovedShortlisted ? _self.nRemovedShortlisted : nRemovedShortlisted // ignore: cast_nullable_to_non_nullable
as int,groupsWithAlertsCount: null == groupsWithAlertsCount ? _self.groupsWithAlertsCount : groupsWithAlertsCount // ignore: cast_nullable_to_non_nullable
as int,recommendedOverallAction: null == recommendedOverallAction ? _self.recommendedOverallAction : recommendedOverallAction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
