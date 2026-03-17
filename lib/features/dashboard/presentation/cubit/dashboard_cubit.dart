import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talentmatch_dashboard/core/domain/usecase/usecase.dart';
import '../../domain/use_case/get_dashboard_data_use_case.dart';
import 'dashboard_state.dart';
import 'package:talentmatch_dashboard/core/error/failure.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardDataUseCase _getDataUseCase;

  DashboardCubit(this._getDataUseCase) : super(const DashboardState.initial());

  Future<void> loadData() async {
    AppLogger.info('DashboardCubit: Starting loadData');
    emit(const DashboardState.loading());
    final result = await _getDataUseCase(const NoParams());

    result.fold(
      (failure) {
        AppLogger.error('DashboardCubit: Error loading data from Use Case');
        emit(DashboardState.error(failure.toMessage()));
      },
      (data) {
        AppLogger.info('DashboardCubit: All data loaded successfully via Use Case');
        emit(DashboardState.loaded(data: data));
      },
    );
  }
}
