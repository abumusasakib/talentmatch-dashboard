// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortlisted_rate_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShortlistedRateSummaryImpl _$$ShortlistedRateSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ShortlistedRateSummaryImpl(
  totalApplications: (json['total_applications'] as num).toInt(),
  shortlistedCount: (json['shortlisted_count'] as num).toInt(),
  shortlistedRate: (json['shortlisted_rate'] as num).toDouble(),
);

Map<String, dynamic> _$$ShortlistedRateSummaryImplToJson(
  _$ShortlistedRateSummaryImpl instance,
) => <String, dynamic>{
  'total_applications': instance.totalApplications,
  'shortlisted_count': instance.shortlistedCount,
  'shortlisted_rate': instance.shortlistedRate,
};
