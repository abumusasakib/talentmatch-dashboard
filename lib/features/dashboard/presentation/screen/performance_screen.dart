import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/score_distribution_entity.dart';
import '../cubit/dashboard_cubit.dart';
import '../cubit/dashboard_state.dart';
import '../widgets/performance_comparison_chart.dart';
import '../widgets/score_distribution_chart.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('Error: $message')),
          loaded: (entity, metadata, impacts, stats, genderDisparity, educationDisparity, scoreDistribution) =>
              _buildContent(metadata, scoreDistribution),
        );
      },
    );
  }

  Widget _buildContent(RunMetadataEntity metadata, List<ScoreDistributionEntity> scoreDistribution) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Model Performance',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Target Recall: ${(metadata.groupThresholding.targetRecall * 100).toStringAsFixed(0)}%  •  '
            'Threshold: ${metadata.groupThresholding.operationalThreshold}',
            style: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(height: 32),
          
          // Performance Comparison Section
          SizedBox(
            height: 500,
            width: double.infinity,
            child: PerformanceComparisonChart(metrics: metadata.modelComparison),
          ),
          
          const SizedBox(height: 32),
          
          // Distribution Section
          SizedBox(
            height: 400,
            width: double.infinity,
            child: ScoreDistributionChart(data: scoreDistribution),
          ),
          
          const SizedBox(height: 48),
          
          // Table Section
          Text(
            'Detailed Metrics',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B).withAlpha(127),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withAlpha(13)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.white.withAlpha(13)),
                columns: const [
                  DataColumn(label: Text('Model', style: TextStyle(color: Colors.white70))),
                  DataColumn(label: Text('Accuracy', style: TextStyle(color: Colors.white70))),
                  DataColumn(label: Text('Precision', style: TextStyle(color: Colors.white70))),
                  DataColumn(label: Text('Recall', style: TextStyle(color: Colors.white70))),
                  DataColumn(label: Text('F1 Score', style: TextStyle(color: Colors.white70))),
                ],
                rows: metadata.modelComparison.map<DataRow>((ModelMetricEntity m) {
                  final bool isBest = metadata.modelComparison
                          .reduce((a, b) => a.f1 > b.f1 ? a : b)
                          .model ==
                      m.model;
                  return DataRow(
                    color: isBest
                        ? WidgetStateProperty.all(const Color(0xFF38BDF8).withAlpha(20))
                        : null,
                    cells: [
                      DataCell(Row(children: [
                        Text(m.model,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                        if (isBest)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ADE80).withAlpha(38),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('Best',
                                style: TextStyle(color: Color(0xFF4ADE80), fontSize: 10)),
                          ),
                      ])),
                      DataCell(Text('${(m.accuracy * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(color: Colors.white70))),
                      DataCell(Text('${(m.precision * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(color: Colors.white70))),
                      DataCell(Text('${(m.recall * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(color: Colors.white70))),
                      DataCell(Text('${(m.f1 * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(color: Colors.white70))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
