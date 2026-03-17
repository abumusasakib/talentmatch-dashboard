import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:talentmatch_dashboard/features/dashboard/presentation/widgets/score_vs_shortlist_chart.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/performance_metrics_entities.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../widgets/stat_card.dart';

import '../widgets/dashboard_state_manager.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardStateManager(
      builder: (context, data) => _buildContent(data.entity, data.impacts, data.rawScores),
    );
  }

  Widget _buildContent(DashboardEntity entity, List<GroupImpactEntity> impacts, List<RawScoreDataPoint> rawScores) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(entity),
          const SizedBox(height: 32),
          _buildStatsGrid(entity),
          const SizedBox(height: 48),
          SizedBox(
            height: 400,
            child: ScoreVsShortlistChart(scores: rawScores),
          ),
          const SizedBox(height: 48),
          _buildGroupImpactTable(impacts),
        ],
      ),
    );
  }

  Widget _buildHeader(DashboardEntity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Executive Overview',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Run: ${_formatRunTime(entity.runUtc)}',
          style: GoogleFonts.inter(color: Colors.white54, fontSize: 16),
        ),
      ],
    );
  }

  String _formatRunTime(String runUtc) {
    try {
      // Use toUtc() and then toLocal() to ensure correct conversion
      // runUtc is in ISO8601 format from the CSV
      final dateTime = DateTime.parse(runUtc).toLocal();
      // Get timezone name (e.g., PDT, GMT+6)
      final tzName = dateTime.timeZoneName;
      return '${DateFormat('MMM dd, yyyy • hh:mm a').format(dateTime)} $tzName';
    } catch (e) {
      return runUtc;
    }
  }

  Widget _buildStatsGrid(DashboardEntity entity) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.6,
      ),
      children: [
        StatCard(
          title: 'Total Candidates',
          value: entity.totalCandidates.toString(),
          icon: Icons.people_outline,
          color: const Color(0xFF38BDF8),
        ),
        StatCard(
          title: 'Shortlisted Rate',
          value: entity.shortlistedRateFormatted,
          subValue: '${entity.shortlistedCount} shortlisted',
          icon: Icons.check_circle_outline,
          color: const Color(0xFF4ADE80),
        ),
        StatCard(
          title: 'Baseline Accuracy',
          value: entity.baselineAccuracyFormatted,
          subValue: 'Naïve Bayes',
          icon: Icons.analytics_outlined,
          color: const Color(0xFFF472B6),
        ),
        StatCard(
          title: 'Active Alerts',
          value: entity.alertCount.toString(),
          subValue: entity.hasNoAlerts ? 'All clear' : 'Action needed',
          icon: Icons.warning_amber_rounded,
          color: entity.hasNoAlerts
              ? const Color(0xFF4ADE80)
              : const Color(0xFFFBBF24),
        ),
      ],
    );
  }

  Widget _buildGroupImpactTable(List<GroupImpactEntity> impacts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Group Impact Analysis',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
            separatorBuilder: (_, __) =>
                Divider(color: Colors.white.withAlpha(13)),
            itemBuilder: (context, index) {
              final impact = impacts[index];
              final bool hasAlert = impact.alert.isNotEmpty;
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                title: Text(
                  '${impact.groupCol}: ${impact.group}',
                  style: GoogleFonts.inter(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Candidates: ${impact.nCandidates}  •  Affected: ${impact.affectedCount}',
                  style: const TextStyle(color: Colors.white54),
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: hasAlert
                        ? Colors.red.withAlpha(26)
                        : Colors.blue.withAlpha(26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    impact.friendlyRecommendedAction,
                    style: TextStyle(
                      color:
                          hasAlert ? Colors.redAccent : Colors.blueAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
