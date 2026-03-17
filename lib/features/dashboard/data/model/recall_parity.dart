class RecallParity {
  final String groupCol;
  final String group;
  final int nCandidates;
  final int nPositive;
  final double achievedRecall;
  final String note;

  RecallParity({
    required this.groupCol,
    required this.group,
    required this.nCandidates,
    required this.nPositive,
    required this.achievedRecall,
    required this.note,
  });

  factory RecallParity.fromJson(Map<String, dynamic> json) {
    return RecallParity(
      groupCol: json['group_col']?.toString() ?? '',
      group: json['group']?.toString() ?? '',
      nCandidates: int.tryParse(json['n_candidates']?.toString() ?? '0') ?? 0,
      nPositive: int.tryParse(json['n_positive']?.toString() ?? '0') ?? 0,
      achievedRecall: double.tryParse(json['achieved_recall']?.toString() ?? '0.0') ?? 0.0,
      note: json['note']?.toString() ?? '',
    );
  }
}
