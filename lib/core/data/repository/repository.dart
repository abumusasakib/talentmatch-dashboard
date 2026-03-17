import 'package:dartz/dartz.dart';
import '../../error/failure.dart';
import 'package:talentmatch_dashboard/core/logging/app_logger.dart';

abstract class Repository {
  const Repository();

  Future<Either<Failure, TRight>> runThroughFailureCatcher<TRight>(
    Future<Either<Failure, TRight>> Function() f,
  ) async {
    return failureCatcher(f);
  }

  static Future<Either<Failure, TRight>> failureCatcher<TRight>(
    Future<Either<Failure, TRight>> Function() f,
  ) async {
    try {
      final right = await f();
      return right;
    } on Failure catch (failure) {
      return Left(failure);
    } on Exception catch (e, stack) {
      AppLogger.error('Exception in failureCatcher', e, stack);
      return const Left(Failure.cacheError());
    } catch (e, stack) {
      AppLogger.error('Unexpected error in failureCatcher', e, stack);
      return const Left(Failure.unHandled());
    }
  }
}
