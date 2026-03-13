// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_disparity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EducationDisparity _$EducationDisparityFromJson(Map<String, dynamic> json) =>
    _EducationDisparity(
      educationLevel: json['Education Level'] as String,
      shortlistedRate: (json['Shortlisted'] as num).toDouble(),
    );

Map<String, dynamic> _$EducationDisparityToJson(_EducationDisparity instance) =>
    <String, dynamic>{
      'Education Level': instance.educationLevel,
      'Shortlisted': instance.shortlistedRate,
    };
