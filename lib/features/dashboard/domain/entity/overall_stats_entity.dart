class OverallStatsEntity {
  final String runUtc;
  final double targetRecall;
  final double operationalThreshold;
  final int nTotalCandidates;
  final int nCandidatesAffected;
  final int nAdditionalShortlisted;
  final int nRemovedShortlisted;
  final int groupsWithAlertsCount;
  final String recommendedOverallAction;

  const OverallStatsEntity({
    required this.runUtc,
    required this.targetRecall,
    required this.operationalThreshold,
    required this.nTotalCandidates,
    required this.nCandidatesAffected,
    required this.nAdditionalShortlisted,
    required this.nRemovedShortlisted,
    required this.groupsWithAlertsCount,
    required this.recommendedOverallAction,
  });
}
