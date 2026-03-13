import 'package:freezed_annotation/freezed_annotation.dart';

part 'shortlisted_rate_summary.freezed.dart';
part 'shortlisted_rate_summary.g.dart';

@freezed
abstract class ShortlistedRateSummary with _$ShortlistedRateSummary {
  const factory ShortlistedRateSummary({
    @JsonKey(name: 'total_applications') required int totalApplications,
    @JsonKey(name: 'shortlisted_count') required int shortlistedCount,
    @JsonKey(name: 'shortlisted_rate') required double shortlistedRate,
  }) = _$ShortlistedRateSummaryImpl;

  factory ShortlistedRateSummary.fromJson(Map<String, dynamic> json) => _$ShortlistedRateSummaryFromJson(json);
}
