import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';
import 'package:talentmatch_dashboard/core/presentation/res/gen/assets.gen.dart';

abstract class DashboardLocalDataSource {
  Future<Map<String, dynamic>> getRunMetadata();
  Future<List<Map<String, dynamic>>> getGroupImpacts();
  Future<List<Map<String, dynamic>>> getOverallStats();
  Future<List<Map<String, dynamic>>> getGenderDisparity();
  Future<List<Map<String, dynamic>>> getEducationDisparity();
  Future<List<Map<String, dynamic>>> getScoreDistribution();
  Future<Map<String, dynamic>> getConfusionMatrix();
  Future<List<Map<String, dynamic>>> getRawScores();
  Future<List<Map<String, dynamic>>> getRecallParity();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  @override
  Future<Map<String, dynamic>> getRunMetadata() async {
    AppLogger.debug('DashboardLocalDataSource: getRunMetadata called');
    final String jsonString =
        await rootBundle.loadString(Assets.outputs.runMetadata);
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> getGroupImpacts() async {
    return _loadCsv(Assets.outputs.dashboardGroupImpacts);
  }

  @override
  Future<List<Map<String, dynamic>>> getOverallStats() async {
    return _loadCsv(Assets.outputs.dashboardOnePage);
  }

  @override
  Future<List<Map<String, dynamic>>> getGenderDisparity() async {
    return _loadCsv(Assets.outputs.edaShortlistByGender);
  }

  @override
  Future<List<Map<String, dynamic>>> getEducationDisparity() async {
    return _loadCsv(Assets.outputs.eduShortlistedProportionCsv);
  }

  @override
  Future<List<Map<String, dynamic>>> getScoreDistribution() async {
    return _loadCsv(Assets.outputs.histogramAiScoreCsv);
  }

  @override
  Future<Map<String, dynamic>> getConfusionMatrix() async {
    // confusion_matrix.csv structure:
    // ,neg,pos
    // neg,90,0
    // pos,193,328
    final String csvString =
        await rootBundle.loadString(Assets.outputs.confusionMatrixCsv);
    final List<List<dynamic>> rows =
        const CsvToListConverter().convert(csvString);

    if (rows.length < 3) return {};

    return {
      'tn': rows[1][1],
      'fp': rows[1][2],
      'fn': rows[2][1],
      'tp': rows[2][2],
    };
  }

  @override
  Future<List<Map<String, dynamic>>> getRawScores() async {
    final String csvString =
        await rootBundle.loadString(Assets.outputs.boxplotAiScoreVsShortlistedCsv);
    final List<List<dynamic>> rows =
        const CsvToListConverter().convert(csvString);

    if (rows.length <= 1) return [];

    final List<String> headers =
        rows[0].map((dynamic e) => e.toString().trim()).toList();
    final int scoreIdx = headers.indexOf('AI Score');
    final int shortlistedIdx = headers.indexOf('Shortlisted');

    return List<Map<String, dynamic>>.generate(rows.length - 1, (int i) {
      final List<dynamic> row = rows[i + 1];
      return {
        'score': double.tryParse(row[scoreIdx].toString()) ?? 0.0,
        'shortlisted': row[shortlistedIdx].toString().toLowerCase() == 'true',
      };
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getRecallParity() async {
    return _loadCsv(Assets.outputs.groupThresholdsTargetRecall);
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
