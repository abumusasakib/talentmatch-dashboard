import 'package:talentmatch_dashboard/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/disparity_entities.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/group_impact_entity.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/overall_stats_entity.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/performance_metrics_entities.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/run_metadata_entity.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/score_distribution_entity.dart';

class DashboardData {
  final DashboardEntity entity;
  final RunMetadataEntity metadata;
  final List<GroupImpactEntity> impacts;
  final OverallStatsEntity stats;
  final List<GenderDisparityEntity> genderDisparity;
  final List<EducationDisparityEntity> educationDisparity;
  final List<ScoreDistributionEntity> scoreDistribution;
  final ConfusionMatrixEntity confusionMatrix;
  final List<RawScoreDataPoint> rawScores;
  final List<RecallParityEntity> recallParity;

  const DashboardData({
    required this.entity,
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