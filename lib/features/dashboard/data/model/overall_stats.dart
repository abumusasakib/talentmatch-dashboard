import 'package:freezed_annotation/freezed_annotation.dart';

part 'overall_stats.freezed.dart';
part 'overall_stats.g.dart';

@freezed
abstract class OverallStats with _$OverallStats {
  const factory OverallStats({
    @JsonKey(name: 'run_utc') required String runUtc,
    @JsonKey(name: 'target_recall') required double targetRecall,
    @JsonKey(name: 'operational_threshold') required double operationalThreshold,
    @JsonKey(name: 'n_total_candidates') required int nTotalCandidates,
    @JsonKey(name: 'n_candidates_affected') required int nCandidatesAffected,
    @JsonKey(name: 'n_additional_shortlisted') required int nAdditionalShortlisted,
    @JsonKey(name: 'n_removed_shortlisted') required int nRemovedShortlisted,
    @JsonKey(name: 'groups_with_alerts_count') required int groupsWithAlertsCount,
    @JsonKey(name: 'recommended_overall_action') required String recommendedOverallAction,
  }) = _$OverallStatsImpl;

  factory OverallStats.fromJson(Map<String, dynamic> json) => _$OverallStatsFromJson(json);
}
