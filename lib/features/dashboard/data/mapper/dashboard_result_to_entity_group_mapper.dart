import '../model/dashboard_result.dart';
import '../../domain/entity/dashboard_entity_group.dart';
import 'dashboard_model_to_entity_mapper.dart';

class DashboardResultToEntityGroupMapper {
  final DashboardModelToEntityMapper _modelToEntityMapper;

  DashboardResultToEntityGroupMapper(this._modelToEntityMapper);

  DashboardEntityGroup map(DashboardResult result) {
    return DashboardEntityGroup(
      metadata: _modelToEntityMapper.mapToRunMetadataEntity(result.metadata),
      impacts: result.impacts
          .map(_modelToEntityMapper.mapToGroupImpactEntity)
          .toList(),
      stats: _modelToEntityMapper.mapToOverallStatsEntity(result.stats),
      genderDisparity: result.genderDisparity
          .map(_modelToEntityMapper.mapToGenderDisparityEntity)
          .toList(),
      educationDisparity: result.educationDisparity
          .map(_modelToEntityMapper.mapToEducationDisparityEntity)
          .toList(),
      scoreDistribution: result.scoreDistribution
          .map(_modelToEntityMapper.mapToScoreDistributionEntity)
          .toList(),
      confusionMatrix:
          _modelToEntityMapper.mapToConfusionMatrixEntity(result.confusionMatrix),
      rawScores: result.rawScores
          .map(_modelToEntityMapper.mapToRawScoreDataPoint)
          .toList(),
      recallParity:
          result.recallParity.map(_modelToEntityMapper.mapToRecallParityEntity).toList(),
    );
  }
}
