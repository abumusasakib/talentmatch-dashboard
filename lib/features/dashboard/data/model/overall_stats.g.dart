// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverallStatsImpl _$$OverallStatsImplFromJson(Map<String, dynamic> json) =>
    _$OverallStatsImpl(
      runUtc: json['run_utc'] as String,
      targetRecall: (json['target_recall'] as num).toDouble(),
      operationalThreshold: (json['operational_threshold'] as num).toDouble(),
      nTotalCandidates: (json['n_total_candidates'] as num).toInt(),
      nCandidatesAffected: (json['n_candidates_affected'] as num).toInt(),
      nAdditionalShortlisted: (json['n_additional_shortlisted'] as num).toInt(),
      nRemovedShortlisted: (json['n_removed_shortlisted'] as num).toInt(),
      groupsWithAlertsCount: (json['groups_with_alerts_count'] as num).toInt(),
      recommendedOverallAction: json['recommended_overall_action'] as String,
    );

Map<String, dynamic> _$$OverallStatsImplToJson(_$OverallStatsImpl instance) =>
    <String, dynamic>{
      'run_utc': instance.runUtc,
      'target_recall': instance.targetRecall,
      'operational_threshold': instance.operationalThreshold,
      'n_total_candidates': instance.nTotalCandidates,
      'n_candidates_affected': instance.nCandidatesAffected,
      'n_additional_shortlisted': instance.nAdditionalShortlisted,
      'n_removed_shortlisted': instance.nRemovedShortlisted,
      'groups_with_alerts_count': instance.groupsWithAlertsCount,
      'recommended_overall_action': instance.recommendedOverallAction,
    };
