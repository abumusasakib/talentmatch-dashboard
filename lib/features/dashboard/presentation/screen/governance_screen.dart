import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/group_impact_entity.dart';

import '../widgets/dashboard_state_manager.dart';

class GovernanceScreen extends StatelessWidget {
  const GovernanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardStateManager(
      builder: (context, data) => _buildContent(context, data.entity, data.metadata, data.impacts),
    );
  }

  Widget _buildContent(BuildContext context, DashboardEntity entity, RunMetadataEntity metadata, List<GroupImpactEntity> impacts) {
    final bool isMobile = MediaQuery.of(context).size.width < 1024;
    // Extract unique subgroup columns from impacts
    final subgroups = impacts.map((GroupImpactEntity i) => i.groupCol).toSet().toList();
    final subgroupsText = subgroups.isEmpty 
        ? 'No cohorts analyzed' 
        : 'Subgroup analysis for ${subgroups.join(", ")}';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Governance',
            style: GoogleFonts.outfit(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          _sectionTitle('System Environment'),
          const SizedBox(height: 16),
          _infoCard([
            _infoRow(context, 'Platform', entity.platform),
            _infoRow(context, 'Python', entity.pythonVersion),
            _infoRow(context, 'Random Seed', entity.seed.toString()),
            _infoRow(context, 'Data Loader', metadata.loadedVia),
          ]),
          const SizedBox(height: 32),
          _sectionTitle('Thresholding Policy'),
          const SizedBox(height: 16),
          _infoCard([
            _infoRow(context, 'Target Recall',
                '${(entity.targetRecall * 100).toStringAsFixed(0)}%'),
            _infoRow(context, 'Operational Threshold',
                entity.operationalThreshold.toString()),
          ]),
          const SizedBox(height: 32),
          _sectionTitle('Audit Trail'),
          const SizedBox(height: 16),
          _buildAuditItem(Icons.merge_type, 'Data Merged',
              'CSV (${metadata.dfCsvRows} rows) + Excel (${metadata.dfXlRows} rows)'),
          _buildAuditItem(Icons.balance, 'Fairness Audit', subgroupsText),
          _buildAuditItem(Icons.analytics_outlined, 'Model Benchmarking',
              'Comparison of ${metadata.modelComparison.length} architectures completed '
                  'with established baseline at ${(entity.baselineAccuracy * 100).toStringAsFixed(1)}% accuracy'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: GoogleFonts.outfit(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      );

  Widget _infoCard(List<Widget> children) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(13),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(13)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children),
      );

  Widget _infoRow(BuildContext context, String label, String value) {
    final bool isSmallMobile = MediaQuery.of(context).size.width < 480;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Flex(
        direction: isSmallMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isSmallMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: isSmallMobile ? null : 180,
            child: Text(label,
                style:
                    const TextStyle(color: Colors.white54, fontSize: 15)),
          ),
          if (isSmallMobile) const SizedBox(height: 4),
          Flexible(
            child: Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }


  Widget _buildAuditItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF38BDF8)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(color: Colors.white60)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
