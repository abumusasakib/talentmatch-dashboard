import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

abstract class DashboardLocalDataSource {
  Future<Map<String, dynamic>> getRunMetadata();
  Future<List<Map<String, dynamic>>> getGroupImpacts();
  Future<List<Map<String, dynamic>>> getOverallStats();
  Future<List<Map<String, dynamic>>> getGenderDisparity();
  Future<List<Map<String, dynamic>>> getEducationDisparity();
  Future<List<Map<String, dynamic>>> getScoreDistribution();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  @override
  Future<Map<String, dynamic>> getRunMetadata() async {
    AppLogger.debug('DashboardLocalDataSource: getRunMetadata called');
    final String jsonString =
        await rootBundle.loadString('assets/outputs/run_metadata.json');
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> getGroupImpacts() async {
    return _loadCsv('assets/outputs/dashboard_group_impacts.csv');
  }

  @override
  Future<List<Map<String, dynamic>>> getOverallStats() async {
    return _loadCsv('assets/outputs/dashboard_one_page.csv');
  }

  @override
  Future<List<Map<String, dynamic>>> getGenderDisparity() async {
    return _loadCsv('assets/outputs/eda_shortlist_by_gender.csv');
  }

  @override
  Future<List<Map<String, dynamic>>> getEducationDisparity() async {
    return _loadCsv('assets/outputs/edu_shortlisted_proportion.csv');
  }

  @override
  Future<List<Map<String, dynamic>>> getScoreDistribution() async {
    return _loadCsv('assets/outputs/histogram_ai_score.csv');
  }

  Future<List<Map<String, dynamic>>> _loadCsv(String path) async {
    AppLogger.debug('DashboardLocalDataSource: Loading CSV from $path');
    final String csvString = await rootBundle.loadString(path);
    final List<List<dynamic>> rows =
        const CsvToListConverter().convert(csvString);
    if (rows.length <= 1) return [];

    final List<String> headers =
        rows[0].map((dynamic e) => e.toString().trim()).toList();
    return List<Map<String, dynamic>>.generate(rows.length - 1, (int i) {
      final Map<String, dynamic> map = <String, dynamic>{};
      for (int j = 0; j < headers.length; j++) {
        map[headers[j]] = rows[i + 1][j];
      }
      return map;
    });
  }
}
