class RecallParityEntity {
  final String groupCol;
  final String group;
  final int nCandidates;
  final int nPositive;
  final double achievedRecall;
  final String note;

  const RecallParityEntity({
    required this.groupCol,
    required this.group,
    required this.nCandidates,
    required this.nPositive,
    required this.achievedRecall,
    required this.note,
  });
}
