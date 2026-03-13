import 'package:get_it/get_it.dart';
import '../../features/dashboard/data/datasource/local/dashboard_local_data_source.dart';
import '../../features/dashboard/data/mapper/dashboard_data_to_model_mapper.dart';
import '../../features/dashboard/data/mapper/dashboard_model_to_entity_mapper.dart';
import '../../features/dashboard/data/repository/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/mapper/dashboard_aggregator_mapper.dart';
import '../../features/dashboard/domain/repository/dashboard_repository.dart';
import '../../features/dashboard/domain/use_case/get_dashboard_data_use_case.dart';
import '../../features/dashboard/presentation/cubit/dashboard_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Dashboard
  
  // Cubit
  sl.registerFactory(
    () => DashboardCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(
    () => GetDashboardDataUseCase(
      repository: sl(),
      aggregatorMapper: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      localDataSource: sl(),
      dataToModelMapper: sl(),
      modelToEntityMapper: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DashboardLocalDataSource>(
    () => DashboardLocalDataSourceImpl(),
  );

  // Mappers
  sl.registerLazySingleton(() => DashboardDataToModelMapper());
  sl.registerLazySingleton(() => DashboardModelToEntityMapper());
  sl.registerLazySingleton(() => DashboardAggregatorMapper());
}
