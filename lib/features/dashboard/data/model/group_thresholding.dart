import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_thresholding.freezed.dart';
part 'group_thresholding.g.dart';

@freezed
abstract class GroupThresholding with _$GroupThresholding {
  const factory GroupThresholding({
    @JsonKey(name: 'target_recall') required double targetRecall,
    @JsonKey(name: 'operational_threshold') required double operationalThreshold,
    @JsonKey(name: 'generated_at') required String generatedAt,
  }) = _$GroupThresholdingImpl;

  factory GroupThresholding.fromJson(Map<String, dynamic> json) => _$GroupThresholdingFromJson(json);
}
