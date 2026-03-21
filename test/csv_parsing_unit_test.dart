import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:csv/csv.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_data_to_model_mapper.dart';

void main() {
  group('CSV Parsing Unit Test', () {
    test('Verify confusion matrix parsing logic', () async {
      final cmData =
          File('assets/outputs/confusion_matrix.csv').readAsStringSync();
      final rows = const CsvToListConverter().convert(cmData);

      expect(rows.length, greaterThanOrEqualTo(3));

      final cmMap = {
        'tn': rows[1][1],
        'fp': rows[1][2],
        'fn': rows[2][1],
        'tp': rows[2][2],
      };

      expect(cmMap['tn'], isNotNull);
    });

    test('Verify group impact mapping with string values (Web simulation)', () {
      final giData =
          File('assets/outputs/dashboard_group_impacts.csv').readAsStringSync();
      final giRows = const CsvToListConverter().convert(giData);
      final headers = giRows[0].map((e) => e.toString().trim()).toList();
      
      final maps = List<Map<String, dynamic>>.generate(giRows.length - 1, (i) {
        final map = <String, dynamic>{};
        for (int j = 0; j < headers.length; j++) {
          // SIMULATE WEB: Force everything to String to mimic JS string returns
          map[headers[j]] = giRows[i + 1][j].toString();
        }
        return map;
      });

      final mapper = DashboardDataToModelMapper();
      final result = mapper.mapToGroupImpacts(maps);

      expect(result.length, equals(giRows.length - 1));
      if (result.isNotEmpty) {
        expect(result.first.groupCol, isNotEmpty);
      }
    });
  });
}
