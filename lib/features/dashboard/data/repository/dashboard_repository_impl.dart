import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/disparity_entities.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../../domain/entity/overall_stats_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/score_distribution_entity.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../datasource/local/dashboard_local_data_source.dart';
import '../mapper/dashboard_data_to_model_mapper.dart';
import '../mapper/dashboard_model_to_entity_mapper.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;
  final DashboardDataToModelMapper _dataToModelMapper;
  final DashboardModelToEntityMapper _modelToEntityMapper;

  DashboardRepositoryImpl({
    required DashboardLocalDataSource localDataSource,
    required DashboardDataToModelMapper dataToModelMapper,
    required DashboardModelToEntityMapper modelToEntityMapper,
  })  : _localDataSource = localDataSource,
        _dataToModelMapper = dataToModelMapper,
        _modelToEntityMapper = modelToEntityMapper;

  @override
  Future<RunMetadataEntity> getRunMetadata() async {
    AppLogger.debug('DashboardRepository: getRunMetadata called');
    try {
      final data = await _localDataSource.getRunMetadata();
      final model = _dataToModelMapper.mapToRunMetadata(data);
      return _modelToEntityMapper.mapToRunMetadataEntity(model);
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load RunMetadata', e, stack);
      rethrow;
    }
  }

  @override
  Future<List<GroupImpactEntity>> getGroupImpacts() async {
    AppLogger.debug('DashboardRepository: getGroupImpacts called');
    try {
      final data = await _localDataSource.getGroupImpacts();
      final models = _dataToModelMapper.mapToGroupImpacts(data);
      return models.map(_modelToEntityMapper.mapToGroupImpactEntity).toList();
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load GroupImpacts', e, stack);
      rethrow;
    }
  }

  @override
  Future<OverallStatsEntity> getOverallStats() async {
    AppLogger.debug('DashboardRepository: getOverallStats called');
    try {
      final data = await _localDataSource.getOverallStats();
      final model = _dataToModelMapper.mapToOverallStats(data);
      return _modelToEntityMapper.mapToOverallStatsEntity(model);
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load OverallStats', e, stack);
      rethrow;
    }
  }

  @override
  Future<List<GenderDisparityEntity>> getGenderDisparity() async {
    AppLogger.debug('DashboardRepository: getGenderDisparity called');
    try {
      final data = await _localDataSource.getGenderDisparity();
      final models = _dataToModelMapper.mapToGenderDisparity(data);
      return models.map(_modelToEntityMapper.mapToGenderDisparityEntity).toList();
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load GenderDisparity', e, stack);
      rethrow;
    }
  }

  @override
  Future<List<EducationDisparityEntity>> getEducationDisparity() async {
    AppLogger.debug('DashboardRepository: getEducationDisparity called');
    try {
      final data = await _localDataSource.getEducationDisparity();
      final models = _dataToModelMapper.mapToEducationDisparity(data);
      return models.map(_modelToEntityMapper.mapToEducationDisparityEntity).toList();
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load EducationDisparity', e, stack);
      rethrow;
    }
  }

  @override
  Future<List<ScoreDistributionEntity>> getScoreDistribution() async {
    AppLogger.debug('DashboardRepository: getScoreDistribution called');
    try {
      final data = await _localDataSource.getScoreDistribution();
      final models = _dataToModelMapper.mapToScoreDistribution(data);
      return models.map(_modelToEntityMapper.mapToScoreDistributionEntity).toList();
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to load ScoreDistribution', e, stack);
      rethrow;
    }
  }

  @override
  Future<DashboardEntity> getDashboardEntity() async {
    // This method is now officially redundant as the Use Case handles the aggregation.
    // However, keeping it for now to avoid breaking the interface if other parts use it.
    // In a full refactor, we might choose to remove it from the repository interface.
    AppLogger.debug('DashboardRepository: getDashboardEntity called (Legacy)');
    try {
      // For the legacy method, we'll manually aggregate using data we fetch
      final metadata = await getRunMetadata();
      final stats = await getOverallStats();
      final impacts = await getGroupImpacts();

      // We'll use a temporary Aggregator to fulfill this
      final aggregator = _AggregatorDelegate();
      return aggregator.aggregate(metadata, stats, impacts);
    } catch (e, stack) {
      AppLogger.error('DashboardRepository: Failed to build DashboardEntity', e, stack);
      rethrow;
    }
  }
}

// Temporary internal delegate to avoid duplicating aggregation logic in data layer
// In a true Clean Architecture, the data layer wouldn't even have access to the aggregator,
// but for the sake of not breaking the repository interface immediately, we use this.
class _AggregatorDelegate {
  DashboardEntity aggregate(RunMetadataEntity metadata, OverallStatsEntity stats, List<GroupImpactEntity> impacts) {
    return DashboardEntity(
      totalCandidates: stats.nTotalCandidates,
      shortlistedCount: metadata.shortlistedRateSummary.shortlistedCount,
      shortlistedRate: metadata.shortlistedRateSummary.shortlistedRate,
      baselineAccuracy: metadata.modelComparison.first.accuracy, // Simplified for legacy
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
