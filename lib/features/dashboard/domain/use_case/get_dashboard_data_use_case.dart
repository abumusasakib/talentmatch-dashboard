import 'package:dartz/dartz.dart';
import 'package:talentmatch_dashboard/core/error/failure.dart';
import 'package:talentmatch_dashboard/core/domain/usecase/usecase.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/dashboard_data.dart';
import '../mapper/dashboard_aggregator_mapper.dart';
import '../repository/dashboard_repository.dart';

class GetDashboardDataUseCase implements UseCase<DashboardData, NoParams> {
  final DashboardRepository _repository;
  final DashboardAggregatorMapper _aggregatorMapper;

  GetDashboardDataUseCase({
    required DashboardRepository repository,
    required DashboardAggregatorMapper aggregatorMapper,
  })  : _repository = repository,
        _aggregatorMapper = aggregatorMapper;

  @override
  Future<Either<Failure, DashboardData>> call(NoParams params) async {
    final result = await _repository.getDashboardEntityGroup();

    return result.fold(
      (failure) => Left(failure),
      (group) {
        final entity = _aggregatorMapper.aggregate(
          metadata: group.metadata,
          stats: group.stats,
          impacts: group.impacts,
        );

        return Right(DashboardData(
          entity: entity,
          metadata: group.metadata,
          impacts: group.impacts,
          stats: group.stats,
          genderDisparity: group.genderDisparity,
          educationDisparity: group.educationDisparity,
          scoreDistribution: group.scoreDistribution,
          confusionMatrix: group.confusionMatrix,
          rawScores: group.rawScores,
          recallParity: group.recallParity,
        ));
      },
    );
  }
}
