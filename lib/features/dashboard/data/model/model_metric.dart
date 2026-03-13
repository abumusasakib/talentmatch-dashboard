import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_metric.freezed.dart';
part 'model_metric.g.dart';

@freezed
abstract class ModelMetric with _$ModelMetric {
  const factory ModelMetric({
    required String model,
    required double accuracy,
    required double precision,
    required double recall,
    required double f1,
  }) = _$ModelMetricImpl;

  factory ModelMetric.fromJson(Map<String, dynamic> json) => _$ModelMetricFromJson(json);
}
