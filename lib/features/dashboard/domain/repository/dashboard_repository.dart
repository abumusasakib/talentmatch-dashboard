import 'package:dartz/dartz.dart';
import 'package:talentmatch_dashboard/core/error/failure.dart';
import '../entity/dashboard_entity_group.dart';
import '../entity/dashboard_entity.dart';
import '../entity/disparity_entities.dart';
import '../entity/group_impact_entity.dart';
import '../entity/overall_stats_entity.dart';
import '../entity/run_metadata_entity.dart';
import '../entity/score_distribution_entity.dart';
import '../entity/performance_metrics_entities.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardEntityGroup>> getDashboardEntityGroup();
  Future<Either<Failure, DashboardEntity>> getDashboardEntity();
  Future<Either<Failure, RunMetadataEntity>> getRunMetadata();
  Future<Either<Failure, List<GroupImpactEntity>>> getGroupImpacts();
  Future<Either<Failure, OverallStatsEntity>> getOverallStats();
  Future<Either<Failure, List<GenderDisparityEntity>>> getGenderDisparity();
  Future<Either<Failure, List<EducationDisparityEntity>>> getEducationDisparity();
  Future<Either<Failure, List<ScoreDistributionEntity>>> getScoreDistribution();
  Future<Either<Failure, List<RecallParityEntity>>> getRecallParity();
}
