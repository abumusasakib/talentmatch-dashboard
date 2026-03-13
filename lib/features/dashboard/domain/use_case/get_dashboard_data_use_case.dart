import '../entity/dashboard_entity.dart';
import '../entity/disparity_entities.dart';
import '../entity/group_impact_entity.dart';
import '../entity/overall_stats_entity.dart';
import '../entity/run_metadata_entity.dart';
import '../entity/score_distribution_entity.dart';
import '../mapper/dashboard_aggregator_mapper.dart';
import '../repository/dashboard_repository.dart';

class DashboardData {
  final DashboardEntity entity;
  final RunMetadataEntity metadata;
  final List<GroupImpactEntity> impacts;
  final OverallStatsEntity stats;
  final List<GenderDisparityEntity> genderDisparity;
  final List<EducationDisparityEntity> educationDisparity;
  final List<ScoreDistributionEntity> scoreDistribution;

  const DashboardData({
    required this.entity,
    required this.metadata,
    required this.impacts,
    required this.stats,
    required this.genderDisparity,
    required this.educationDisparity,
    required this.scoreDistribution,
  });
}

class GetDashboardDataUseCase {
  final DashboardRepository _repository;
  final DashboardAggregatorMapper _aggregatorMapper;

  GetDashboardDataUseCase({
    required DashboardRepository repository,
    required DashboardAggregatorMapper aggregatorMapper,
  })  : _repository = repository,
        _aggregatorMapper = aggregatorMapper;

  Future<DashboardData> execute() async {
    final metadata = await _repository.getRunMetadata();
    final impacts = await _repository.getGroupImpacts();
    final stats = await _repository.getOverallStats();
    final genderDisparity = await _repository.getGenderDisparity();
    final educationDisparity = await _repository.getEducationDisparity();
    final scoreDistribution = await _repository.getScoreDistribution();

    final entity = _aggregatorMapper.aggregate(
      metadata: metadata,
      stats: stats,
      impacts: impacts,
    );

    return DashboardData(
      entity: entity,
      metadata: metadata,
      impacts: impacts,
      stats: stats,
      genderDisparity: genderDisparity,
      educationDisparity: educationDisparity,
      scoreDistribution: scoreDistribution,
    );
  }
}
