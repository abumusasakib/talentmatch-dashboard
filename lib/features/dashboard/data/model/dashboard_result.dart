import 'data_models.dart';

class DashboardResult {
  final RunMetadata metadata;
  final List<GroupImpact> impacts;
  final OverallStats stats;
  final List<GenderDisparity> genderDisparity;
  final List<EducationDisparity> educationDisparity;
  final List<ScoreDistribution> scoreDistribution;
  final List<RecallParity> recallParity;
  final Map<String, dynamic> confusionMatrix;
  final List<Map<String, dynamic>> rawScores;

  const DashboardResult({
    required this.metadata,
    required this.impacts,
    required this.stats,
    required this.genderDisparity,
    required this.educationDisparity,
    required this.scoreDistribution,
    required this.recallParity,
    required this.confusionMatrix,
    required this.rawScores,
  });
}
