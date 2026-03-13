class RunMetadataEntity {
  final String dateUtc;
  final String python;
  final String platform;
  final int seed;
  final int dfCsvRows;
  final int dfXlRows;
  final String loadedVia;
  final List<ModelMetricEntity> modelComparison;
  final ShortlistedRateSummaryEntity shortlistedRateSummary;
  final GroupThresholdingEntity groupThresholding;

  const RunMetadataEntity({
    required this.dateUtc,
    required this.python,
    required this.platform,
    required this.seed,
    required this.dfCsvRows,
    required this.dfXlRows,
    required this.loadedVia,
    required this.modelComparison,
    required this.shortlistedRateSummary,
    required this.groupThresholding,
  });
}

class ModelMetricEntity {
  final String model;
  final double accuracy;
  final double precision;
  final double recall;
  final double f1;

  const ModelMetricEntity({
    required this.model,
    required this.accuracy,
    required this.precision,
    required this.recall,
    required this.f1,
  });
}

class ShortlistedRateSummaryEntity {
  final int shortlistedCount;
  final double shortlistedRate;

  const ShortlistedRateSummaryEntity({
    required this.shortlistedCount,
    required this.shortlistedRate,
  });
}

class GroupThresholdingEntity {
  final double targetRecall;
  final double operationalThreshold;
  final String generatedAt;

  const GroupThresholdingEntity({
    required this.targetRecall,
    required this.operationalThreshold,
    required this.generatedAt,
  });
}
