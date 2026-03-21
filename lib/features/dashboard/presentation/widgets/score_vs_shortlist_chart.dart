import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:talentmatch_dashboard/core/presentation/res/gen/colors.gen.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/performance_metrics_entities.dart';

class ScoreVsShortlistChart extends StatelessWidget {
  final List<RawScoreDataPoint> scores;

  const ScoreVsShortlistChart({
    super.key,
    required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    // Process data for two histograms: Shortlisted vs Rejected
    final List<int> shortlistedBins = List.filled(11, 0); // 0-10
    final List<int> rejectedBins = List.filled(11, 0);

    for (final s in scores) {
      final bin = s.score.clamp(0, 10).floor();
      if (s.shortlisted) {
        shortlistedBins[bin]++;
      } else {
        rejectedBins[bin]++;
      }
    }

    int maxVal = 0;
    for (int i = 0; i < 11; i++) {
      if (shortlistedBins[i] > maxVal) maxVal = shortlistedBins[i];
      if (rejectedBins[i] > maxVal) maxVal = rejectedBins[i];
    }
    final double dynamicMaxY = (maxVal == 0 ? 10 : maxVal * 1.1).toDouble();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorName.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'Score vs Shortlist Insight',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorName.textPrimary,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: dynamicMaxY,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: ColorName.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      reservedSize: 28,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          color: ColorName.textSecondary,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: ColorName.surfaceVariant,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(11, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: rejectedBins[i].toDouble(),
                        color: ColorName.error.withOpacity(0.6),
                        width: 8,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      BarChartRodData(
                        toY: shortlistedBins[i].toDouble(),
                        color: ColorName.success.withOpacity(0.6),
                        width: 8,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(color: ColorName.error.withOpacity(0.6), label: 'Rejected'),
              const SizedBox(width: 16),
              _LegendItem(color: ColorName.success.withOpacity(0.6), label: 'Shortlisted'),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 10, color: ColorName.textSecondary),
        ),
      ],
    );
  }
}
