import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_distribution.freezed.dart';
part 'score_distribution.g.dart';

@freezed
abstract class ScoreDistribution with _$ScoreDistribution {
  const factory ScoreDistribution({
    @JsonKey(name: 'bin_left') required double binLeft,
    @JsonKey(name: 'bin_right') required double binRight,
    required int count,
  }) = _ScoreDistribution;

  factory ScoreDistribution.fromJson(Map<String, dynamic> json) =>
      _$ScoreDistributionFromJson(json);
}
