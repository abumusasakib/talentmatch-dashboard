// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RunMetadataImpl _$$RunMetadataImplFromJson(Map<String, dynamic> json) =>
    _$RunMetadataImpl(
      dateUtc: json['date_utc'] as String,
      python: json['python'] as String,
      platform: json['platform'] as String,
      seed: (json['seed'] as num).toInt(),
      dfCsvRows: (json['df_csv_rows'] as num).toInt(),
      dfXlRows: (json['df_xl_rows'] as num).toInt(),
      loadedVia: json['loaded_via'] as String,
      modelComparison: (json['model_comparison'] as List<dynamic>)
          .map((e) => ModelMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortlistedRateSummary: ShortlistedRateSummary.fromJson(
        json['shortlisted_rate_summary'] as Map<String, dynamic>,
      ),
      groupThresholding: GroupThresholding.fromJson(
        json['group_thresholding'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$RunMetadataImplToJson(_$RunMetadataImpl instance) =>
    <String, dynamic>{
      'date_utc': instance.dateUtc,
      'python': instance.python,
      'platform': instance.platform,
      'seed': instance.seed,
      'df_csv_rows': instance.dfCsvRows,
      'df_xl_rows': instance.dfXlRows,
      'loaded_via': instance.loadedVia,
      'model_comparison': instance.modelComparison,
      'shortlisted_rate_summary': instance.shortlistedRateSummary,
      'group_thresholding': instance.groupThresholding,
    };
