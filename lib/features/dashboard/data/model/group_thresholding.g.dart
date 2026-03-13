// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_thresholding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupThresholdingImpl _$$GroupThresholdingImplFromJson(
  Map<String, dynamic> json,
) => _$GroupThresholdingImpl(
  targetRecall: (json['target_recall'] as num).toDouble(),
  operationalThreshold: (json['operational_threshold'] as num).toDouble(),
  generatedAt: json['generated_at'] as String,
);

Map<String, dynamic> _$$GroupThresholdingImplToJson(
  _$GroupThresholdingImpl instance,
) => <String, dynamic>{
  'target_recall': instance.targetRecall,
  'operational_threshold': instance.operationalThreshold,
  'generated_at': instance.generatedAt,
};
