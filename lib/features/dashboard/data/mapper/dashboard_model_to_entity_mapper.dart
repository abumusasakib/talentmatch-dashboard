import '../../domain/entity/disparity_entities.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../../domain/entity/overall_stats_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/score_distribution_entity.dart';
import '../model/data_models.dart';
import '../../domain/entity/performance_metrics_entities.dart';

class DashboardModelToEntityMapper {
  RunMetadataEntity mapToRunMetadataEntity(RunMetadata model) {
    return RunMetadataEntity(
      dateUtc: model.dateUtc,
      python: model.python,
      platform: model.platform,
      seed: model.seed,
      dfCsvRows: model.dfCsvRows,
      dfXlRows: model.dfXlRows,
      loadedVia: model.loadedVia,
      modelComparison: model.modelComparison
          .map((m) => ModelMetricEntity(
                model: m.model,
                accuracy: m.accuracy,
                precision: m.precision,
                recall: m.recall,
                f1: m.f1,
              ))
          .toList(),
      shortlistedRateSummary: ShortlistedRateSummaryEntity(
        shortlistedCount: model.shortlistedRateSummary.shortlistedCount,
        shortlistedRate: model.shortlistedRateSummary.shortlistedRate,
      ),
      groupThresholding: GroupThresholdingEntity(
        targetRecall: model.groupThresholding.targetRecall,
        operationalThreshold: model.groupThresholding.operationalThreshold,
        generatedAt: model.groupThresholding.generatedAt,
      ),
    );
  }

  GroupImpactEntity mapToGroupImpactEntity(GroupImpact model) {
    return GroupImpactEntity(
      groupCol: model.groupCol,
      group: model.group,
      nCandidates: model.nCandidates,
      affectedCount: model.affectedCount,
      additionalShortlisted: model.additionalShortlisted,
      removedShortlisted: model.removedShortlisted,
      fpChange: model.fpChange,
      recommendedAction: model.recommendedAction,
      alert: model.alert,
    );
  }

  OverallStatsEntity mapToOverallStatsEntity(OverallStats model) {
    return OverallStatsEntity(
      runUtc: model.runUtc,
      targetRecall: model.targetRecall,
      operationalThreshold: model.operationalThreshold,
      nTotalCandidates: model.nTotalCandidates,
      nCandidatesAffected: model.nCandidatesAffected,
      nAdditionalShortlisted: model.nAdditionalShortlisted,
      nRemovedShortlisted: model.nRemovedShortlisted,
      groupsWithAlertsCount: model.groupsWithAlertsCount,
      recommendedOverallAction: model.recommendedOverallAction,
    );
  }

  GenderDisparityEntity mapToGenderDisparityEntity(GenderDisparity model) {
    return GenderDisparityEntity(
      gender: model.gender,
      total: model.total,
      shortlisted: model.shortlisted,
      shortlistedRate: model.shortlistedRate,
    );
  }

  EducationDisparityEntity mapToEducationDisparityEntity(EducationDisparity model) {
    return EducationDisparityEntity(
      educationLevel: model.educationLevel,
      shortlistedRate: model.shortlistedRate,
    );
  }

  ScoreDistributionEntity mapToScoreDistributionEntity(ScoreDistribution model) {
    return ScoreDistributionEntity(
      binCenter: (model.binLeft + model.binRight) / 2,
      binLeft: model.binLeft,
      binRight: model.binRight,
      count: model.count,
    );
  }

  ConfusionMatrixEntity mapToConfusionMatrixEntity(Map<String, dynamic> data) {
    return ConfusionMatrixEntity(
      trueNegative: data['tn'] as int,
      falsePositive: data['fp'] as int,
      falseNegative: data['fn'] as int,
      truePositive: data['tp'] as int,
    );
  }

  RawScoreDataPoint mapToRawScoreDataPoint(Map<String, dynamic> data) {
    return RawScoreDataPoint(
      score: data['score'] as double,
      shortlisted: data['shortlisted'] as bool,
    );
  }

  RecallParityEntity mapToRecallParityEntity(RecallParity model) {
    return RecallParityEntity(
      groupCol: model.groupCol,
      group: model.group,
      nCandidates: model.nCandidates,
      nPositive: model.nPositive,
      achievedRecall: model.achievedRecall,
      note: model.note,
    );
  }
}
