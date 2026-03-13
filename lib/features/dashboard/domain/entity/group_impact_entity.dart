class GroupImpactEntity {
  final String groupCol;
  final String group;
  final int nCandidates;
  final int affectedCount;
  final int additionalShortlisted;
  final int removedShortlisted;
  final double fpChange;
  final String recommendedAction;
  final String alert;

  const GroupImpactEntity({
    required this.groupCol,
    required this.group,
    required this.nCandidates,
    required this.affectedCount,
    required this.additionalShortlisted,
    required this.removedShortlisted,
    required this.fpChange,
    required this.recommendedAction,
    required this.alert,
  });

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
        return alert
            .split('_')
            .map((word) => word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1)}'
                : '')
            .join(' ');
    }
  }
}
