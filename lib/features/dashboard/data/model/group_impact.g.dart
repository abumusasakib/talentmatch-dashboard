// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_impact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpactImpl _$$GroupImpactImplFromJson(Map<String, dynamic> json) =>
    _$GroupImpactImpl(
      groupCol: json['group_col'] as String,
      group: json['group'] as String,
      nCandidates: (json['n_candidates'] as num).toInt(),
      affectedCount: (json['affected_count'] as num).toInt(),
      additionalShortlisted: (json['additional_shortlisted'] as num).toInt(),
      removedShortlisted: (json['removed_shortlisted'] as num).toInt(),
      fpChange: (json['fp_change'] as num).toDouble(),
      recommendedAction: json['recommended_action'] as String,
      alert: json['alert'] as String,
    );

Map<String, dynamic> _$$GroupImpactImplToJson(_$GroupImpactImpl instance) =>
    <String, dynamic>{
      'group_col': instance.groupCol,
      'group': instance.group,
      'n_candidates': instance.nCandidates,
      'affected_count': instance.affectedCount,
      'additional_shortlisted': instance.additionalShortlisted,
      'removed_shortlisted': instance.removedShortlisted,
      'fp_change': instance.fpChange,
      'recommended_action': instance.recommendedAction,
      'alert': instance.alert,
    };
