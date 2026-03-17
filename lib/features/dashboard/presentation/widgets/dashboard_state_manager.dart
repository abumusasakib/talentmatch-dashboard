import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/dashboard_data.dart';
import '../../presentation/cubit/dashboard_cubit.dart';
import '../../presentation/cubit/dashboard_state.dart';
import '../../../../core/presentation/widgets/app_error_widget.dart';
import 'dashboard_loading_shimmer.dart';

typedef DashboardDataBuilder = Widget Function(BuildContext context, DashboardData data);

class DashboardStateManager extends StatelessWidget {
  final DashboardDataBuilder builder;
  final bool showLoadingOnlyOnInitial;

  const DashboardStateManager({
    super.key,
    required this.builder,
    this.showLoadingOnlyOnInitial = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return state.when(
          initial: () => const DashboardLoadingShimmer(),
          loading: () => showLoadingOnlyOnInitial 
              ? const SizedBox.shrink() 
              : const DashboardLoadingShimmer(),
          error: (message) => AppErrorWidget(
            message: message,
            onRetry: () => context.read<DashboardCubit>().loadData(),
          ),
          loaded: (data) {
            return builder(context, data);
          },
        );
      },
    );
  }
}
