import '../model/data_models.dart';

class DashboardDataToModelMapper {
  RunMetadata mapToRunMetadata(Map<String, dynamic> data) {
    return RunMetadata.fromJson(data);
  }

  List<GroupImpact> mapToGroupImpacts(List<Map<String, dynamic>> data) {
    return data.map((json) => GroupImpact.fromJson(json)).toList();
  }

  OverallStats mapToOverallStats(List<Map<String, dynamic>> data) {
    if (data.isEmpty) {
      throw Exception('Overall stats data is empty');
    }
    return OverallStats.fromJson(data.first);
  }

  List<GenderDisparity> mapToGenderDisparity(List<Map<String, dynamic>> data) {
    return data.map((json) => GenderDisparity.fromJson(json)).toList();
  }

  List<EducationDisparity> mapToEducationDisparity(List<Map<String, dynamic>> data) {
    return data.map((json) => EducationDisparity.fromJson(json)).toList();
  }

  List<ScoreDistribution> mapToScoreDistribution(List<Map<String, dynamic>> data) {
    return data.map((json) => ScoreDistribution.fromJson(json)).toList();
  }
}
