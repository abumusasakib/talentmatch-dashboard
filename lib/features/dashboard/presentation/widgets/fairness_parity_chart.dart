import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:talentmatch_dashboard/core/presentation/res/gen/colors.gen.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/performance_metrics_entities.dart';

class FairnessParityChart extends StatelessWidget {
  final List<RecallParityEntity> recallParity;
  final double targetRecall;

  const FairnessParityChart({
    super.key,
    required this.recallParity,
    required this.targetRecall,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    // Group data by groupCol
    final Map<String, List<RecallParityEntity>> groupedData = {};
    for (final entry in recallParity) {
      groupedData.putIfAbsent(entry.groupCol, () => []).add(entry);
    }

    final groupCols = groupedData.keys.toList();

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: ColorName.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorName.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recall Parity by Group',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Equality of Opportunity Audit',
                    style: GoogleFonts.inter(
                      color: Colors.white54,
                      fontSize: isMobile ? 10 : 12,
                    ),
                  ),
                ],
              ),
              if (isMobile) const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _LegendItem(color: const Color(0xFF4E79A7), label: 'Pass', isMobile: isMobile),
                  const SizedBox(width: 16),
                  _LegendItem(color: const Color(0xFFE15759), label: 'Alert', isMobile: isMobile),
                ],
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 32),
          Expanded(
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                if (!isMobile) ...[
                  // Y-Axis Label
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Achieved Recall (TPR)',
                      style: GoogleFonts.inter(
                        color: Colors.white30,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: groupCols.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final col = entry.value;
                      final data = groupedData[col]!;
                      final isFirst = idx == 0;
                      final isLast = idx == groupCols.length - 1;

                      Widget chart() => Container(
                            margin: EdgeInsets.only(
                              left: (isFirst || isMobile) ? 0 : 8,
                              right: (isLast || isMobile) ? 0 : 8,
                              top: (isFirst || !isMobile) ? 0 : 8,
                              bottom: (isLast || !isMobile) ? 0 : 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(5),
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: Colors.white.withAlpha(10)),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  col,
                                  style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: _IndividualParityChart(
                                    data: data,
                                    targetRecall: targetRecall,
                                    showYAxis: isFirst || isMobile,
                                    showTargetLabel: isLast,
                                  ),
                                ),
                              ],
                            ),
                          );

                      return isMobile ? Expanded(child: chart()) : Expanded(child: chart());
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Demographic Group',
              style: GoogleFonts.inter(
                color: Colors.white30,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IndividualParityChart extends StatelessWidget {
  final List<RecallParityEntity> data;
  final double targetRecall;
  final bool showYAxis;
  final bool showTargetLabel;

  const _IndividualParityChart({
    required this.data,
    required this.targetRecall,
    required this.showYAxis,
    required this.showTargetLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 1.0,
        minY: 0,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => ColorName.surfaceVariant,
            getTooltipItem: (group, x, rod, rodIndex) {
              return BarTooltipItem(
                '${data[x].group}\n',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Recall: ${(rod.toY * 100).toStringAsFixed(1)}%',
                    style: TextStyle(
                      color: rod.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < data.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Text(
                        data[value.toInt()].group,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: showYAxis,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white24,
                  fontSize: 10,
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
            color: Colors.white.withAlpha(13),
            strokeWidth: 1,
          ),
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: targetRecall,
              color: Colors.redAccent.withAlpha(80),
              strokeWidth: 1.5,
              dashArray: [4, 4],
              label: HorizontalLineLabel(
                show: showTargetLabel,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 8),
                style: GoogleFonts.inter(
                  color: Colors.redAccent.withAlpha(160),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                labelResolver: (line) => 'Target',
              ),
            ),
          ],
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(data.length, (i) {
          final recall = data[i].achievedRecall;
          final isBelow = recall < targetRecall;
          final isMobile = MediaQuery.of(context).size.width < 600;
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: recall,
                color: isBelow ? const Color(0xFFE15759) : const Color(0xFF4E79A7),
                width: isMobile ? 14 : 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final bool isMobile;

  const _LegendItem({required this.color, required this.label, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: isMobile ? 10 : 12, color: Colors.white70),
        ),
      ],
    );
  }
}
