import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/datasource/local/dashboard_local_data_source.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_data_to_model_mapper.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_model_to_entity_mapper.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_result_to_entity_group_mapper.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/model/dashboard_result.dart';

void main() {
  testWidgets('Parse dashboard data on web', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final dataSource = DashboardLocalDataSourceImpl();
    final dataMapper = DashboardDataToModelMapper();
    final modelMapper = DashboardModelToEntityMapper();
    final entityMapper = DashboardResultToEntityGroupMapper(modelMapper);

    try {
      debugPrint('Fetching metadata...');
      final metadataRaw = await dataSource.getRunMetadata();
      debugPrint('Fetching impacts...');
      final impactsRaw = await dataSource.getGroupImpacts();
      debugPrint('Fetching stats...');
      final statsRaw = await dataSource.getOverallStats();
      debugPrint('Fetching gender...');
      final genderRaw = await dataSource.getGenderDisparity();
      debugPrint('Fetching edu...');
      final eduRaw = await dataSource.getEducationDisparity();
      debugPrint('Fetching score dist...');
      final scoreDistRaw = await dataSource.getScoreDistribution();
      debugPrint('Fetching confusion matrix...');
      final cmRaw = await dataSource.getConfusionMatrix();
      debugPrint('Fetching raw scores...');
      final rawScoresRaw = await dataSource.getRawScores();
      debugPrint('Fetching recall parity...');
      final recallParityRaw = await dataSource.getRecallParity();

      debugPrint('All data sources passed.');

      final result = DashboardResult(
        metadata: dataMapper.mapToRunMetadata(metadataRaw),
        impacts: dataMapper.mapToGroupImpacts(impactsRaw),
        stats: dataMapper.mapToOverallStats(statsRaw),
        genderDisparity: dataMapper.mapToGenderDisparity(genderRaw),
        educationDisparity: dataMapper.mapToEducationDisparity(eduRaw),
        scoreDistribution: dataMapper.mapToScoreDistribution(scoreDistRaw),
        recallParity: dataMapper.mapToRecallParity(recallParityRaw),
        confusionMatrix: cmRaw,
        rawScores: rawScoresRaw,
      );

      final entityGroup = entityMapper.map(result);
      debugPrint('Entity mapping passed. Impacts count: ${entityGroup.impacts.length}');
      
      expect(entityGroup.impacts.isNotEmpty, true);
      expect(entityGroup.metadata.dateUtc.isNotEmpty, true);

      debugPrint('All integration checks passed.');

    } catch (e, st) {
      debugPrint('CRASH: $e');
      debugPrint(st.toString());
      fail('Failed to load or map data');
    }
  });
}
