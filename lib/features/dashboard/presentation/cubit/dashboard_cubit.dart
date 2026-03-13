import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_case/get_dashboard_data_use_case.dart';
import 'dashboard_state.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardDataUseCase _getDataUseCase;

  DashboardCubit(this._getDataUseCase) : super(const DashboardState.initial());

  Future<void> loadData() async {
    AppLogger.info('DashboardCubit: Starting loadData');
    emit(const DashboardState.loading());
    try {
      final data = await _getDataUseCase.execute();

      AppLogger.info('DashboardCubit: All data loaded successfully via Use Case');
      emit(DashboardState.loaded(
        entity: data.entity,
        metadata: data.metadata,
        impacts: data.impacts,
        stats: data.stats,
        genderDisparity: data.genderDisparity,
        educationDisparity: data.educationDisparity,
        scoreDistribution: data.scoreDistribution,
      ));
    } catch (e, stack) {
      AppLogger.error('DashboardCubit: Error loading data', e, stack);
      emit(DashboardState.error(e.toString()));
    }
  }
}
