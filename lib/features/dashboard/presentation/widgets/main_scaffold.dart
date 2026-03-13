import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Row(
        children: [
          _buildNavigationRail(context, location),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E293B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext context, String currentLocation) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogo(),
            const SizedBox(height: 48),
            _NavItem(
              icon: Icons.dashboard_outlined,
              label: 'Overview',
              isSelected: currentLocation == '/',
              onTap: () => context.go('/'),
            ),
            _NavItem(
              icon: Icons.analytics_outlined,
              label: 'Performance',
              isSelected: currentLocation == '/performance',
              onTap: () => context.go('/performance'),
            ),
            _NavItem(
              icon: Icons.gavel_outlined,
              label: 'Fairness Audit',
              isSelected: currentLocation == '/fairness',
              onTap: () => context.go('/fairness'),
            ),
            _NavItem(
              icon: Icons.security_outlined,
              label: 'Governance',
              isSelected: currentLocation == '/governance',
              onTap: () => context.go('/governance'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF38BDF8), Color(0xFF818CF8)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.psychology, color: Colors.white, size: 28),
        ),
        const SizedBox(width: 12),
        Text(
          'TalentMatch AI',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withAlpha(26) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF38BDF8)
                    : Colors.white60,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontSize: 16,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
