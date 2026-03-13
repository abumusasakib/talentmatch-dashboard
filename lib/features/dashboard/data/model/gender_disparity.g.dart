// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_disparity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenderDisparity _$GenderDisparityFromJson(Map<String, dynamic> json) =>
    _GenderDisparity(
      gender: json['Gender'] as String,
      total: (json['total'] as num).toInt(),
      shortlisted: (json['shortlisted'] as num).toInt(),
      shortlistedRate: (json['shortlisted_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$GenderDisparityToJson(_GenderDisparity instance) =>
    <String, dynamic>{
      'Gender': instance.gender,
      'total': instance.total,
      'shortlisted': instance.shortlisted,
      'shortlisted_rate': instance.shortlistedRate,
    };
