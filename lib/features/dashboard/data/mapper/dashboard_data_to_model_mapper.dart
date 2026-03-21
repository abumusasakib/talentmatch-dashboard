import '../model/data_models.dart';

/// Robust helpers for CSV-sourced data where all values may arrive as Strings.
int _csvInt(dynamic v) => num.tryParse(v?.toString() ?? '')?.toInt() ?? 0;
double _csvDouble(dynamic v) => double.tryParse(v?.toString() ?? '') ?? 0.0;
String _csvStr(dynamic v) => v?.toString() ?? '';

class DashboardDataToModelMapper {
  RunMetadata mapToRunMetadata(Map<String, dynamic> data) {
    return RunMetadata.fromJson(data);
  }

  List<GroupImpact> mapToGroupImpacts(List<Map<String, dynamic>> data) {
    return data.map((row) {
      return GroupImpact(
        groupCol: _csvStr(row['group_col']),
        group: _csvStr(row['group']),
        nCandidates: _csvInt(row['n_candidates']),
        affectedCount: _csvInt(row['affected_count']),
        additionalShortlisted: _csvInt(row['additional_shortlisted']),
        removedShortlisted: _csvInt(row['removed_shortlisted']),
        fpChange: _csvDouble(row['fp_change']),
        recommendedAction: _csvStr(row['recommended_action']),
        alert: _csvStr(row['alert']),
      );
    }).toList();
  }

  OverallStats mapToOverallStats(List<Map<String, dynamic>> data) {
    if (data.isEmpty) throw Exception('Overall stats data is empty');
    final row = data.first;
    return OverallStats(
      runUtc: _csvStr(row['run_utc']),
      targetRecall: _csvDouble(row['target_recall']),
      operationalThreshold: _csvDouble(row['operational_threshold']),
      nTotalCandidates: _csvInt(row['n_total_candidates']),
      nCandidatesAffected: _csvInt(row['n_candidates_affected']),
      nAdditionalShortlisted: _csvInt(row['n_additional_shortlisted']),
      nRemovedShortlisted: _csvInt(row['n_removed_shortlisted']),
      groupsWithAlertsCount: _csvInt(row['groups_with_alerts_count']),
      recommendedOverallAction: _csvStr(row['recommended_overall_action']),
    );
  }

  List<GenderDisparity> mapToGenderDisparity(List<Map<String, dynamic>> data) {
    return data.map((row) {
      return GenderDisparity(
        gender: _csvStr(row['Gender']),
        total: _csvInt(row['total']),
        shortlisted: _csvInt(row['shortlisted']),
        shortlistedRate: _csvDouble(row['shortlisted_rate']),
      );
    }).toList();
  }

  List<EducationDisparity> mapToEducationDisparity(
      List<Map<String, dynamic>> data) {
    return data.map((row) {
      return EducationDisparity(
        educationLevel: _csvStr(row['Education Level']),
        shortlistedRate: _csvDouble(row['Shortlisted']),
      );
    }).toList();
  }

  List<ScoreDistribution> mapToScoreDistribution(
      List<Map<String, dynamic>> data) {
    return data.map((row) {
      return ScoreDistribution(
        binLeft: _csvDouble(row['bin_left']),
        binRight: _csvDouble(row['bin_right']),
        count: _csvInt(row['count']),
      );
    }).toList();
  }

  List<RecallParity> mapToRecallParity(List<Map<String, dynamic>> data) {
    return data.map((row) {
      return RecallParity(
        groupCol: _csvStr(row['group_col']),
        group: _csvStr(row['group']),
        nCandidates: _csvInt(row['n_candidates']),
        nPositive: _csvInt(row['n_positive']),
        achievedRecall: _csvDouble(row['achieved_recall']),
        note: _csvStr(row['note']),
      );
    }).toList();
  }
}
