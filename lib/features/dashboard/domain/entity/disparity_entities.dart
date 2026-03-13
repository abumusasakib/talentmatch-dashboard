class GenderDisparityEntity {
  final String gender;
  final int total;
  final int shortlisted;
  final double shortlistedRate;

  const GenderDisparityEntity({
    required this.gender,
    required this.total,
    required this.shortlisted,
    required this.shortlistedRate,
  });
}

class EducationDisparityEntity {
  final String educationLevel;
  final double shortlistedRate;

  const EducationDisparityEntity({
    required this.educationLevel,
    required this.shortlistedRate,
  });
}
