import 'run_metadata_entity.dart';
import 'group_impact_entity.dart';
import 'overall_stats_entity.dart';
import 'disparity_entities.dart';
import 'score_distribution_entity.dart';
import 'performance_metrics_entities.dart';

class DashboardEntityGroup {
  final RunMetadataEntity metadata;
  final List<GroupImpactEntity> impacts;
  final OverallStatsEntity stats;
  final List<GenderDisparityEntity> genderDisparity;
  final List<EducationDisparityEntity> educationDisparity;
  final List<ScoreDistributionEntity> scoreDistribution;
  final ConfusionMatrixEntity confusionMatrix;
  final List<RawScoreDataPoint> rawScores;
  final List<RecallParityEntity> recallParity;

  const DashboardEntityGroup({
    required this.metadata,
    required this.impacts,
    required this.stats,
    required this.genderDisparity,
    required this.educationDisparity,
    required this.scoreDistribution,
    required this.confusionMatrix,
    required this.rawScores,
    required this.recallParity,
  });
}
