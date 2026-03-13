// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreDistribution _$ScoreDistributionFromJson(Map<String, dynamic> json) =>
    _ScoreDistribution(
      binLeft: (json['bin_left'] as num).toDouble(),
      binRight: (json['bin_right'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$ScoreDistributionToJson(_ScoreDistribution instance) =>
    <String, dynamic>{
      'bin_left': instance.binLeft,
      'bin_right': instance.binRight,
      'count': instance.count,
    };
