import '../entity/dashboard_entity.dart';
import '../entity/disparity_entities.dart';
import '../entity/group_impact_entity.dart';
import '../entity/overall_stats_entity.dart';
import '../entity/run_metadata_entity.dart';
import '../entity/score_distribution_entity.dart';

abstract class DashboardRepository {
  Future<DashboardEntity> getDashboardEntity();
  Future<RunMetadataEntity> getRunMetadata();
  Future<List<GroupImpactEntity>> getGroupImpacts();
  Future<OverallStatsEntity> getOverallStats();
  Future<List<GenderDisparityEntity>> getGenderDisparity();
  Future<List<EducationDisparityEntity>> getEducationDisparity();
  Future<List<ScoreDistributionEntity>> getScoreDistribution();
}
