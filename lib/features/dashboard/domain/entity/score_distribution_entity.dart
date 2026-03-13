class ScoreDistributionEntity {
  final double binCenter;
  final double binLeft;
  final double binRight;
  final int count;

  const ScoreDistributionEntity({
    required this.binCenter,
    required this.binLeft,
    required this.binRight,
    required this.count,
  });
}
