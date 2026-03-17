import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../../domain/entity/disparity_entities.dart';
import '../../domain/entity/performance_metrics_entities.dart';
import '../widgets/bias_charts.dart';
import 'package:talentmatch_dashboard/features/dashboard/presentation/widgets/fairness_parity_chart.dart';
import '../widgets/dashboard_state_manager.dart';

class FairnessScreen extends StatelessWidget {
  const FairnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardStateManager(
      builder: (context, data) => _buildContent(
        data.entity.alertCount,
        data.impacts,
        data.genderDisparity,
        data.educationDisparity,
        data.recallParity,
        data.metadata.groupThresholding.targetRecall,
      ),
    );
  }

  Widget _buildContent(
    int alertCount,
    List<GroupImpactEntity> impacts,
    List<GenderDisparityEntity> genderDisparity,
    List<EducationDisparityEntity> educationDisparity,
    List<RecallParityEntity> recallParity,
    double targetRecall,
  ) {
    final List<GroupImpactEntity> alerts =
        impacts.where((GroupImpactEntity i) => i.alert.isNotEmpty).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fairness Audit',
            style: GoogleFonts.outfit(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          
          if (alerts.isNotEmpty) ...[
            _buildAlertBox(alerts),
            const SizedBox(height: 32),
          ],

          SizedBox(
            height: 400,
            child: FairnessParityChart(
              recallParity: recallParity,
              targetRecall: targetRecall,
            ),
          ),
          const SizedBox(height: 48),

          // Visual Bias Indicators - Vertical Stack to prevent squishing
          SizedBox(
            height: 400,
            width: double.infinity,
            child: GenderBiasChart(data: genderDisparity),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: EducationBiasChart(data: educationDisparity),
          ),

          const SizedBox(height: 48),

          Text(
            'Subgroup Impact Analysis',
            style: GoogleFonts.outfit(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B).withAlpha(127),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withAlpha(13)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: impacts.length,
              separatorBuilder: (_, __) => Divider(color: Colors.white.withAlpha(13)),
              itemBuilder: (context, index) {
                final GroupImpactEntity impact = impacts[index];
                final bool hasAlert = impact.alert.isNotEmpty;
                return ListTile(
                  contentPadding: const EdgeInsets.all(24),
                  title: Text(
                    '${impact.groupCol}: ${impact.group}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '+${impact.additionalShortlisted} shortlisted  •  FP Δ: ${impact.fpChange.toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        impact.friendlyRecommendedAction,
                        style: TextStyle(
                            color: hasAlert ? Colors.orangeAccent : Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      if (hasAlert)
                        Text(impact.friendlyAlert,
                            style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertBox(List<GroupImpactEntity> alerts) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(26),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red.withAlpha(51)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 32),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Critical Fairness Alerts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text(
                  '${alerts.length} group(s) require manual review.',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
