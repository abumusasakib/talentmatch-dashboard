import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/dashboard_data.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _$InitialImpl;
  const factory DashboardState.loading() = _$LoadingImpl;
  const factory DashboardState.loaded({
    required DashboardData data,
  }) = _$LoadedImpl;
  const factory DashboardState.error(String message) = _$ErrorImpl;
}
