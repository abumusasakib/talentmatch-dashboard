import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_impact.freezed.dart';
part 'group_impact.g.dart';

@freezed
abstract class GroupImpact with _$GroupImpact {
  const factory GroupImpact({
    @JsonKey(name: 'group_col') required String groupCol,
    required String group,
    @JsonKey(name: 'n_candidates') required int nCandidates,
    @JsonKey(name: 'affected_count') required int affectedCount,
    @JsonKey(name: 'additional_shortlisted') required int additionalShortlisted,
    @JsonKey(name: 'removed_shortlisted') required int removedShortlisted,
    @JsonKey(name: 'fp_change') required double fpChange,
    @JsonKey(name: 'recommended_action') required String recommendedAction,
    required String alert,
  }) = _$GroupImpactImpl;

  factory GroupImpact.fromJson(Map<String, dynamic> json) => _$GroupImpactFromJson(json);
}

extension GroupImpactX on GroupImpact {
  String get friendlyRecommendedAction {
    switch (recommendedAction) {
      case 'apply_group_threshold':
        return 'Apply Optimized Threshold';
      case 'manual_review + consider_retraining':
        return 'Manual Review & Retraining';
      case 'apply_adjusted_threshold_and_monitor':
        return 'Adjusted Threshold & Monitor';
      case 'monitor_and_manual_review_for_borderline_scores':
        return 'Monitor Borderline Scores';
      default:
        // Fallback: Convert snake_case to Title Case
        return recommendedAction
            .split('_')
            .map((word) => word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1)}'
                : '')
            .join(' ');
    }
  }

  String get friendlyAlert {
    if (alert.isEmpty) return '';
    switch (alert) {
      case 'no_positive_examples_or_unable_to_meet_target':
        return 'Insufficient positive data';
      case 'fp_tolerance_unresolved':
        return 'High FP risk unresolved';
      case 'fp_rate_adjusted_down':
        return 'FP rate adjusted down';
      case 'achieved_recall_below_minimum':
        return 'Recall below minimum limit';
      case 'FP_rate_increase':
        return 'Significant FP increase';
      case 'unable_to_meet_target_recall':
        return 'Target recall not met';
      default:
        // Fallback: Convert snake_case to Title Case
        return alert
            .split('_')
            .map((word) => word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1)}'
                : '')
            .join(' ');
    }
  }
}
