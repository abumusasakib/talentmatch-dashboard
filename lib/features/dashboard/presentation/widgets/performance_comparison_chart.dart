import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/run_metadata_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceComparisonChart extends StatelessWidget {
  final List<ModelMetricEntity> metrics;

  const PerformanceComparisonChart({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    // Colors for different models
    final modelColors = [
      const Color(0xFF38BDF8), // Light Blue
      const Color(0xFF818CF8), // Indigo
      const Color(0xFF34D399), // Emerald
      const Color(0xFFFBBF24), // Amber
      const Color(0xFFF472B6), // Pink
      const Color(0xFFA78BFA), // Violet
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8).withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.compare_arrows, color: Color(0xFF38BDF8), size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Metric-wise Model Comparison',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Legend(metrics: metrics, colors: modelColors),
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 1.0,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => const Color(0xFF0F172A),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final metricName = _getMetricName(groupIndex);
                      final model = metrics[rodIndex].model;
                      return BarTooltipItem(
                        '$metricName\n',
                        GoogleFonts.inter(color: Colors.white70, fontSize: 10),
                        children: [
                          TextSpan(
                            text: '$model: ${(rod.toY * 100).toStringAsFixed(1)}%',
                            style: GoogleFonts.inter(
                              color: modelColors[rodIndex % modelColors.length],
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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
                      reservedSize: 32, // Added reserved size to prevent cut-off
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 12, // Space between bar and title
                          child: Text(
                            _getMetricName(value.toInt()),
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
                        return Text(
                          '${(value * 100).toInt()}%',
                          style: const TextStyle(color: Colors.white54, fontSize: 10),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withAlpha(10),
                    strokeWidth: 1,
                  ),
                ),
                barGroups: List.generate(4, (metricIndex) {
                  return BarChartGroupData(
                    x: metricIndex,
                    barsSpace: 4,
                    barRods: metrics.asMap().entries.map((e) {
                      final modelIndex = e.key;
                      final m = e.value;
                      double value;
                      switch (metricIndex) {
                        case 0: value = m.accuracy; break;
                        case 1: value = m.precision; break;
                        case 2: value = m.recall; break;
                        case 3: value = m.f1; break;
                        default: value = 0.0;
                      }
                      return BarChartRodData(
                        toY: value,
                        color: modelColors[modelIndex % modelColors.length],
                        width: 12,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMetricName(int index) {
    switch (index) {
      case 0: return 'Accuracy';
      case 1: return 'Precision';
      case 2: return 'Recall';
      case 3: return 'F1 Score';
      default: return '';
    }
  }
}

class _Legend extends StatelessWidget {
  final List<ModelMetricEntity> metrics;
  final List<Color> colors;

  const _Legend({required this.metrics, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: metrics.asMap().entries.map((e) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: colors[e.key % colors.length],
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              e.value.model,
              style: GoogleFonts.inter(color: Colors.white70, fontSize: 11),
            ),
          ],
        );
      }).toList(),
    );
  }
}
