import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/app_shimmer.dart';

class DashboardLoadingShimmer extends StatelessWidget {
  const DashboardLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title section shimmer
          const AppShimmer.rectangular(height: 32, width: 200),
          const SizedBox(height: 8),
          const AppShimmer.rectangular(height: 16, width: 300),
          const SizedBox(height: 24),
          
          // Stat Cards grid shimmer
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => const AppShimmer.rectangular(),
          ),
          const SizedBox(height: 24),
          
          // Large chart shimmer
          const AppShimmer.rectangular(height: 300),
          const SizedBox(height: 24),
          
          // Another chart or list section
          Row(
            children: const [
              Expanded(child: AppShimmer.rectangular(height: 200)),
              SizedBox(width: 16),
              Expanded(child: AppShimmer.rectangular(height: 200)),
            ],
          ),
        ],
      ),
    );
  }
}
