import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/entity/run_metadata_entity.dart';
import '../../domain/entity/group_impact_entity.dart';
import '../cubit/dashboard_cubit.dart';
import '../cubit/dashboard_state.dart';

class GovernanceScreen extends StatelessWidget {
  const GovernanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('Error: $message')),
          loaded: (entity, metadata, impacts, stats, genderDisparity, educationDisparity, scoreDistribution) =>
              _buildContent(entity, metadata, impacts),
        );
      },
    );
  }

  Widget _buildContent(DashboardEntity entity, RunMetadataEntity metadata, List<GroupImpactEntity> impacts) {
    // Extract unique subgroup columns from impacts
    final subgroups = impacts.map((GroupImpactEntity i) => i.groupCol).toSet().toList();
    final subgroupsText = subgroups.isEmpty 
        ? 'No cohorts analyzed' 
        : 'Subgroup analysis for ${subgroups.join(", ")}';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
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
            _infoRow('Platform', entity.platform),
            _infoRow('Python', entity.pythonVersion),
            _infoRow('Random Seed', entity.seed.toString()),
            _infoRow('Data Loader', metadata.loadedVia),
          ]),
          const SizedBox(height: 32),
          _sectionTitle('Thresholding Policy'),
          const SizedBox(height: 16),
          _infoCard([
            _infoRow('Target Recall',
                '${(entity.targetRecall * 100).toStringAsFixed(0)}%'),
            _infoRow('Operational Threshold',
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
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(13),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(13)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children),
      );

  Widget _infoRow(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SizedBox(
              width: 180,
              child: Text(label,
                  style:
                      const TextStyle(color: Colors.white54, fontSize: 15)),
            ),
            Expanded(
              child: Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );


  Widget _buildAuditItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
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
