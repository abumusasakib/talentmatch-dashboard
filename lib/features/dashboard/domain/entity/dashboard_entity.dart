/// Pure domain entity representing the summarised state of the
/// TalentMatch AI shortlisting pipeline for a single run.
/// Unlike the data-layer models this class has NO JSON / CSV
/// serialisation logic – it is only concerned with business rules.
class DashboardEntity {
  final int totalCandidates;
  final int shortlistedCount;
  final double shortlistedRate;
  final double baselineAccuracy;
  final int alertCount;
  final double targetRecall;
  final double operationalThreshold;
  final String runUtc;
  final String platform;
  final String pythonVersion;
  final int seed;

  const DashboardEntity({
    required this.totalCandidates,
    required this.shortlistedCount,
    required this.shortlistedRate,
    required this.baselineAccuracy,
    required this.alertCount,
    required this.targetRecall,
    required this.operationalThreshold,
    required this.runUtc,
    required this.platform,
    required this.pythonVersion,
    required this.seed,
  });

  /// Whether the pipeline met the target recall on all groups.
  bool get hasNoAlerts => alertCount == 0;

  /// Human-readable shortlist percentage.
  String get shortlistedRateFormatted =>
      '${(shortlistedRate * 100).toStringAsFixed(1)}%';

  /// Human-readable baseline accuracy percentage.
  String get baselineAccuracyFormatted =>
      '${(baselineAccuracy * 100).toStringAsFixed(1)}%';
}
