import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entity/disparity_entities.dart';
import 'bias_chart_container.dart';

class GenderBiasChart extends StatelessWidget {
  final List<GenderDisparityEntity> data;

  const GenderBiasChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Calculate population average as a parity benchmark
    final totalCandidates = data.fold<int>(0, (sum, e) => sum + e.total);
    final totalShortlisted = data.fold<int>(0, (sum, e) => sum + e.shortlisted);
    final avgRate = totalCandidates > 0 ? totalShortlisted / totalCandidates : 0.0;

    return BiasChartContainer(
      title: 'Gender Shortlist Rate',
      icon: Icons.wc,
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 1.0,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (_) => const Color(0xFF0F172A),
                  tooltipRoundedRadius: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final entity = data[groupIndex];
                    return BarTooltipItem(
                      '${entity.gender}\n',
                      GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '${(rod.toY * 100).toStringAsFixed(1)}%\n',
                          style: TextStyle(
                            color: rod.color,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '${entity.shortlisted} / ${entity.total} candidates',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
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
                    getTitlesWidget: (value, meta) {
                      if (value < 0 || value >= data.length) return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          data[value.toInt()].gender,
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    getTitlesWidget: (value, meta) {
                      if (value == 0 || value == 1.0) {
                        return Text(
                          '${(value * 100).toInt()}%',
                          style: const TextStyle(color: Colors.white38, fontSize: 10),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 0.2,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.white.withAlpha(5),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    y: avgRate,
                    color: const Color(0xFF94A3B8).withAlpha(150),
                    strokeWidth: 2,
                    dashArray: [10, 5],
                    label: HorizontalLineLabel(
                      show: true,
                      alignment: Alignment.topRight,
                      labelResolver: (line) => 'Parity (${(avgRate * 100).toStringAsFixed(1)}%)',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              barGroups: data.asMap().entries.map((e) {
                final isFemale = e.value.gender == 'F';
                final isOther = e.value.gender == 'Other';
                
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.shortlistedRate,
                      color: isOther 
                          ? const Color(0xFFFBBF24) 
                          : (isFemale ? const Color(0xFFF472B6) : const Color(0xFF38BDF8)),
                      width: 40,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 1.0,
                        color: const Color(0xFF334155).withAlpha(50),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
