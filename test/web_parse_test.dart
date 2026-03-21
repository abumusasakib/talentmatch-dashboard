import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/datasource/local/dashboard_local_data_source.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_data_to_model_mapper.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_model_to_entity_mapper.dart';
import 'package:talentmatch_dashboard/features/dashboard/data/mapper/dashboard_result_to_entity_group_mapper.dart';

void main() {
  testWidgets('Parse dashboard data on web', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final dataSource = DashboardLocalDataSourceImpl();
    final dataMapper = DashboardDataToModelMapper();
    final modelMapper = DashboardModelToEntityMapper();
    final entityMapper = DashboardResultToEntityGroupMapper(modelMapper);

    try {
      print('Fetching metadata...');
      await dataSource.getRunMetadata();
      print('Fetching impacts...');
      await dataSource.getGroupImpacts();
      print('Fetching stats...');
      await dataSource.getOverallStats();
      print('Fetching gender...');
      await dataSource.getGenderDisparity();
      print('Fetching edu...');
      await dataSource.getEducationDisparity();
      print('Fetching score dist...');
      await dataSource.getScoreDistribution();
      print('Fetching confusion matrix...');
      final cm = await dataSource.getConfusionMatrix();
      print('Confusion matrix: $cm');
      print('Fetching raw scores...');
      await dataSource.getRawScores();
      print('Fetching recall parity...');
      await dataSource.getRecallParity();

      print('All data sources passed.');

      final metadataResult = await dataSource.getRunMetadata();
      final statsResult = await dataSource.getOverallStats();
      final impactsResult = await dataSource.getGroupImpacts();
      
      dataMapper.mapToRunMetadata(metadataResult);
      dataMapper.mapToOverallStats(statsResult);
      dataMapper.mapToGroupImpacts(impactsResult);

      print('All data mappers passed.');

    } catch (e, st) {
      print('CRASH: $e');
      print(st);
      fail('Failed to load data');
    }
  });
}
