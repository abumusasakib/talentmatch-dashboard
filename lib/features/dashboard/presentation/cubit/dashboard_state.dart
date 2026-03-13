import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/disparity_entities.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../../domain/entity/overall_stats_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/score_distribution_entity.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _$InitialImpl;
  const factory DashboardState.loading() = _$LoadingImpl;
  const factory DashboardState.loaded({
    required DashboardEntity entity,
    required RunMetadataEntity metadata,
    required List<GroupImpactEntity> impacts,
    required OverallStatsEntity stats,
    required List<GenderDisparityEntity> genderDisparity,
    required List<EducationDisparityEntity> educationDisparity,
    required List<ScoreDistributionEntity> scoreDistribution,
  }) = _$LoadedImpl;
  const factory DashboardState.error(String message) = _$ErrorImpl;
}
