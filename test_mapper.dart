import 'dart:io';
import 'package:csv/csv.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/model/data_models.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_data_to_model_mapper.dart';

void main() async {
  final cmData = File('assets/outputs/confusion_matrix.csv').readAsStringSync();
  final rows = const CsvToListConverter().convert(cmData);
  int parseValue(dynamic val) {
    if (val is int) return val;
    return int.tryParse(val.toString()) ?? 0;
  }
  
  Map<String, dynamic> cmMap = {
    'tn': rows[1][1], // We simulate the web behavior by explicitly casting toString later
    'fp': rows[1][2],
    'fn': rows[2][1],
    'tp': rows[2][2],
  };

  try {
    // Just directly trigger the type cast using the OLD code
    print('Testing old group impact parsing (without tryParse)...');
    final giData = File('assets/outputs/dashboard_group_impacts.csv').readAsStringSync();
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

    print('Calling mapToGroupImpacts...');
    final mapper = DashboardDataToModelMapper();
    // Use the NEW mapper logic on these strings!
    final result = mapper.mapToGroupImpacts(maps);
    print('Success! Mapped ${result.length} items.');
  } catch (e, st) {
    print('CRASH: $e');
    print(st);
  }
}
