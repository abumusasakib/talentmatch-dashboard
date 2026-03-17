class ConfusionMatrixEntity {
  final int trueNegative;
  final int falsePositive;
  final int falseNegative;
  final int truePositive;

  const ConfusionMatrixEntity({
    required this.trueNegative,
    required this.falsePositive,
    required this.falseNegative,
    required this.truePositive,
  });

  int get total => trueNegative + falsePositive + falseNegative + truePositive;

  double get accuracy => (truePositive + trueNegative) / total;
  double get precision => truePositive / (truePositive + falsePositive);
  double get recall => truePositive / (truePositive + falseNegative);
}
