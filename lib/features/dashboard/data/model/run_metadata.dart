import 'package:freezed_annotation/freezed_annotation.dart';
import 'model_metric.dart';
import 'shortlisted_rate_summary.dart';
import 'group_thresholding.dart';

part 'run_metadata.freezed.dart';
part 'run_metadata.g.dart';

@freezed
abstract class RunMetadata with _$RunMetadata {
  const factory RunMetadata({
    @JsonKey(name: 'date_utc') required String dateUtc,
    required String python,
    required String platform,
    required int seed,
    @JsonKey(name: 'df_csv_rows') required int dfCsvRows,
    @JsonKey(name: 'df_xl_rows') required int dfXlRows,
    @JsonKey(name: 'loaded_via') required String loadedVia,
    @JsonKey(name: 'model_comparison') required List<ModelMetric> modelComparison,
    @JsonKey(name: 'shortlisted_rate_summary') required ShortlistedRateSummary shortlistedRateSummary,
    @JsonKey(name: 'group_thresholding') required GroupThresholding groupThresholding,
  }) = _$RunMetadataImpl;

  factory RunMetadata.fromJson(Map<String, dynamic> json) => _$RunMetadataFromJson(json);
}
