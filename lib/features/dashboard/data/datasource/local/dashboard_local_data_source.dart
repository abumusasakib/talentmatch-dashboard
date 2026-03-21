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
    try {
      AppLogger.debug('DashboardLocalDataSource: getRunMetadata called');
      final String jsonString =
          await rootBundle.loadString(Assets.outputs.runMetadata);
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      // Re-throw so Repository failureCatcher handles it
      rethrow;
    }
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
    try {
      final String csvString =
          await rootBundle.loadString(Assets.outputs.confusionMatrixCsv);
      final List<List<dynamic>> rows =
          const CsvToListConverter().convert(csvString);

      if (rows.length < 3) return {};

      // Robust parsing for web where types might be inferred as strings
      int parseValue(dynamic val) {
        if (val is int) return val;
        return int.tryParse(val.toString()) ?? 0;
      }

      return {
        'tn': parseValue(rows[1][1]),
        'fp': parseValue(rows[1][2]),
        'fn': parseValue(rows[2][1]),
        'tp': parseValue(rows[2][2]),
      };
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getRawScores() async {
    try {
      final String csvString = await rootBundle.loadString(
          Assets.outputs.boxplotAiScoreVsShortlistedCsv);
      final List<List<dynamic>> rows =
          const CsvToListConverter().convert(csvString);

      if (rows.length <= 1) return [];

      final List<String> headers =
          rows[0].map((dynamic e) => e.toString().trim()).toList();
      final int scoreIdx = headers.indexOf('AI Score');
      final int shortlistedIdx = headers.indexOf('Shortlisted');

      if (scoreIdx == -1 || shortlistedIdx == -1) {
        return [];
      }

      return List<Map<String, dynamic>>.generate(rows.length - 1, (int i) {
        final List<dynamic> row = rows[i + 1];
        return {
          'score': double.tryParse(row[scoreIdx].toString()) ?? 0.0,
          'shortlisted': row[shortlistedIdx].toString().toLowerCase() == 'true',
        };
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getRecallParity() async {
    return _loadCsv(Assets.outputs.groupThresholdsTargetRecall);
  }

  Future<List<Map<String, dynamic>>> _loadCsv(String path) async {
    try {
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
    } catch (e) {
      rethrow;
    }
  }
}
