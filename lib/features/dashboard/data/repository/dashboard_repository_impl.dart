import 'package:dartz/dartz.dart';
import 'package:talentmatch_dashboard/core/error/failure.dart';
import 'package:talentmatch_dashboard/core/data/repository/repository.dart';
import '../../domain/entity/dashboard_entity_group.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/disparity_entities.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../../domain/entity/overall_stats_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/score_distribution_entity.dart';
import '../../domain/entity/performance_metrics_entities.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../datasource/local/dashboard_local_data_source.dart';
import '../mapper/dashboard_data_to_model_mapper.dart';
import '../mapper/dashboard_model_to_entity_mapper.dart';
import '../mapper/dashboard_result_to_entity_group_mapper.dart';
import '../model/dashboard_result.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

class DashboardRepositoryImpl extends Repository
    implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;
  final DashboardDataToModelMapper _dataToModelMapper;
  final DashboardModelToEntityMapper _modelToEntityMapper;
  final DashboardResultToEntityGroupMapper _resultToEntityGroupMapper;

  DashboardRepositoryImpl({
    required DashboardLocalDataSource localDataSource,
    required DashboardDataToModelMapper dataToModelMapper,
    required DashboardModelToEntityMapper modelToEntityMapper,
    required DashboardResultToEntityGroupMapper resultToEntityGroupMapper,
  }) : _localDataSource = localDataSource,
       _dataToModelMapper = dataToModelMapper,
       _modelToEntityMapper = modelToEntityMapper,
       _resultToEntityGroupMapper = resultToEntityGroupMapper;

  @override
  Future<Either<Failure, DashboardEntityGroup>>
  getDashboardEntityGroup() async {
    AppLogger.debug('DashboardRepository: getDashboardEntityGroup called');
    return Repository.failureCatcher(() async {
      final [
        runMetadataJson as Map<String, dynamic>,
        groupImpactsCsv as List<Map<String, dynamic>>,
        overallStatsCsv as List<Map<String, dynamic>>,
        genderDisparityCsv as List<Map<String, dynamic>>,
        educationDisparityCsv as List<Map<String, dynamic>>,
        scoreDistributionCsv as List<Map<String, dynamic>>,
        confusionMatrixCsv as Map<String, dynamic>,
        rawScoresCsv as List<Map<String, dynamic>>,
        recallParityCsv as List<Map<String, dynamic>>,
      ] = await Future.wait([
        _localDataSource.getRunMetadata(),
        _localDataSource.getGroupImpacts(),
        _localDataSource.getOverallStats(),
        _localDataSource.getGenderDisparity(),
        _localDataSource.getEducationDisparity(),
        _localDataSource.getScoreDistribution(),
        _localDataSource.getConfusionMatrix(),
        _localDataSource.getRawScores(),
        _localDataSource.getRecallParity(),
      ]);

      final result = DashboardResult(
        metadata: _dataToModelMapper.mapToRunMetadata(runMetadataJson),
        impacts: _dataToModelMapper.mapToGroupImpacts(groupImpactsCsv),
        stats: _dataToModelMapper.mapToOverallStats(overallStatsCsv),
        genderDisparity: _dataToModelMapper.mapToGenderDisparity(
          genderDisparityCsv,
        ),
        educationDisparity: _dataToModelMapper.mapToEducationDisparity(
          educationDisparityCsv,
        ),
        scoreDistribution: _dataToModelMapper.mapToScoreDistribution(
          scoreDistributionCsv,
        ),
        recallParity: _dataToModelMapper.mapToRecallParity(recallParityCsv),
        confusionMatrix: confusionMatrixCsv,
        rawScores: rawScoresCsv,
      );

      return Right(_resultToEntityGroupMapper.map(result));
    });
  }

  @override
  Future<Either<Failure, List<RecallParityEntity>>> getRecallParity() async {
    AppLogger.debug('DashboardRepository: getRecallParity called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getRecallParity();
      final models = _dataToModelMapper.mapToRecallParity(data);
      return Right(
        models.map(_modelToEntityMapper.mapToRecallParityEntity).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, RunMetadataEntity>> getRunMetadata() async {
    AppLogger.debug('DashboardRepository: getRunMetadata called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getRunMetadata();
      final model = _dataToModelMapper.mapToRunMetadata(data);
      return Right(_modelToEntityMapper.mapToRunMetadataEntity(model));
    });
  }

  @override
  Future<Either<Failure, List<GroupImpactEntity>>> getGroupImpacts() async {
    AppLogger.debug('DashboardRepository: getGroupImpacts called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getGroupImpacts();
      final models = _dataToModelMapper.mapToGroupImpacts(data);
      return Right(
        models.map(_modelToEntityMapper.mapToGroupImpactEntity).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, OverallStatsEntity>> getOverallStats() async {
    AppLogger.debug('DashboardRepository: getOverallStats called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getOverallStats();
      final model = _dataToModelMapper.mapToOverallStats(data);
      return Right(_modelToEntityMapper.mapToOverallStatsEntity(model));
    });
  }

  @override
  Future<Either<Failure, List<GenderDisparityEntity>>>
  getGenderDisparity() async {
    AppLogger.debug('DashboardRepository: getGenderDisparity called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getGenderDisparity();
      final models = _dataToModelMapper.mapToGenderDisparity(data);
      return Right(
        models.map(_modelToEntityMapper.mapToGenderDisparityEntity).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, List<EducationDisparityEntity>>>
  getEducationDisparity() async {
    AppLogger.debug('DashboardRepository: getEducationDisparity called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getEducationDisparity();
      final models = _dataToModelMapper.mapToEducationDisparity(data);
      return Right(
        models.map(_modelToEntityMapper.mapToEducationDisparityEntity).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, List<ScoreDistributionEntity>>>
  getScoreDistribution() async {
    AppLogger.debug('DashboardRepository: getScoreDistribution called');
    return Repository.failureCatcher(() async {
      final data = await _localDataSource.getScoreDistribution();
      final models = _dataToModelMapper.mapToScoreDistribution(data);
      return Right(
        models.map(_modelToEntityMapper.mapToScoreDistributionEntity).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, DashboardEntity>> getDashboardEntity() async {
    AppLogger.debug('DashboardRepository: getDashboardEntity called (Legacy)');
    return Repository.failureCatcher(() async {
      final metadataResult = await getRunMetadata();
      final statsResult = await getOverallStats();
      final impactsResult = await getGroupImpacts();

      return metadataResult.fold(
        (l) => Left(l),
        (metadata) => statsResult.fold(
          (l) => Left(l),
          (stats) => impactsResult.fold((l) => Left(l), (impacts) {
            final aggregator = _AggregatorDelegate();
            return Right(aggregator.aggregate(metadata, stats, impacts));
          }),
        ),
      );
    });
  }
}

class _AggregatorDelegate {
  DashboardEntity aggregate(
    RunMetadataEntity metadata,
    OverallStatsEntity stats,
    List<GroupImpactEntity> impacts,
  ) {
    return DashboardEntity(
      totalCandidates: stats.nTotalCandidates,
      shortlistedCount: metadata.shortlistedRateSummary.shortlistedCount,
      shortlistedRate: metadata.shortlistedRateSummary.shortlistedRate,
      baselineAccuracy: metadata.modelComparison.first.accuracy,
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
