import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_disparity.freezed.dart';
part 'education_disparity.g.dart';

@freezed
abstract class EducationDisparity with _$EducationDisparity {
  const factory EducationDisparity({
    @JsonKey(name: 'Education Level') required String educationLevel,
    @JsonKey(name: 'Shortlisted') required double shortlistedRate,
  }) = _EducationDisparity;

  factory EducationDisparity.fromJson(Map<String, dynamic> json) =>
      _$EducationDisparityFromJson(json);
}
