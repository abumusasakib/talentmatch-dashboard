// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelMetricImpl _$$ModelMetricImplFromJson(Map<String, dynamic> json) =>
    _$ModelMetricImpl(
      model: json['model'] as String,
      accuracy: (json['accuracy'] as num).toDouble(),
      precision: (json['precision'] as num).toDouble(),
      recall: (json['recall'] as num).toDouble(),
      f1: (json['f1'] as num).toDouble(),
    );

Map<String, dynamic> _$$ModelMetricImplToJson(_$ModelMetricImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'accuracy': instance.accuracy,
      'precision': instance.precision,
      'recall': instance.recall,
      'f1': instance.f1,
    };
