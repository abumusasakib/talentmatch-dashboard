import '../entity/dashboard_entity.dart';
import '../entity/group_impact_entity.dart';
import '../entity/overall_stats_entity.dart';
import '../entity/run_metadata_entity.dart';

class DashboardAggregatorMapper {
  DashboardEntity aggregate({
    required RunMetadataEntity metadata,
    required OverallStatsEntity stats,
    required List<GroupImpactEntity> impacts,
  }) {
    return DashboardEntity(
      totalCandidates: stats.nTotalCandidates,
      shortlistedCount: metadata.shortlistedRateSummary.shortlistedCount,
      shortlistedRate: metadata.shortlistedRateSummary.shortlistedRate,
      baselineAccuracy: metadata.modelComparison
          .firstWhere(
            (m) => m.model == 'NaiveBayes',
            orElse: () => metadata.modelComparison.first,
          )
          .accuracy,
      alertCount: impacts.where((g) => g.alert.isNotEmpty).length,
      targetRecall: stats.targetRecall,
      operationalThreshold: stats.operationalThreshold,
      runUtc: stats.runUtc,
      platform: metadata.platform,
      pythonVersion: metadata.python,
      seed: metadata.seed,
    );
  }
}
