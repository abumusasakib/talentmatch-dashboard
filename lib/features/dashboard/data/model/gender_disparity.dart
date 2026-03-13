import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_disparity.freezed.dart';
part 'gender_disparity.g.dart';

@freezed
abstract class GenderDisparity with _$GenderDisparity {
  const factory GenderDisparity({
    @JsonKey(name: 'Gender') required String gender,
    required int total,
    required int shortlisted,
    @JsonKey(name: 'shortlisted_rate') required double shortlistedRate,
  }) = _GenderDisparity;

  factory GenderDisparity.fromJson(Map<String, dynamic> json) =>
      _$GenderDisparityFromJson(json);
}
