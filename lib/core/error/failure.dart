import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.cacheError() = CacheError;
  const factory Failure.unHandled() = UnHandled;
}

extension FailureX on Failure {
  String toMessage() {
    return when(
      cacheError: () => 'Unable to load dashboard data. Please ensure assets are present.',
      unHandled: () => 'An unexpected error occurred while processing data.',
    );
  }
}
