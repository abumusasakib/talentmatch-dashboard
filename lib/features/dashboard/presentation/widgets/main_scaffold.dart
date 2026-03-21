import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_framework/responsive_framework.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  bool isSidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isTablet;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: isMobile
          ? AppBar(
              backgroundColor: const Color(0xFF0F172A),
              elevation: 0,
              title: _buildLogo(isCollapsed: false),
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              backgroundColor: const Color(0xFF0F172A),
              child: _buildNavigationRail(context, location, isMobile: true),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            _buildNavigationRail(context, location, isMobile: false),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: isMobile
                    ? BorderRadius.zero
                    : const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
              ),
              child: ClipRRect(
                borderRadius: isMobile
                    ? BorderRadius.zero
                    : const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext context, String currentLocation,
      {required bool isMobile}) {
    final bool effectiveCollapsed = !isMobile && isSidebarCollapsed;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isMobile ? 280 : (effectiveCollapsed ? 80 : 250),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: effectiveCollapsed
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (!isMobile) ...[
              _buildLogo(isCollapsed: effectiveCollapsed),
              const SizedBox(height: 24),
              _buildCollapseToggle(effectiveCollapsed),
              const SizedBox(height: 32),
            ],
            _NavItem(
              icon: Icons.dashboard_outlined,
              label: 'Overview',
              isSelected: currentLocation == '/',
              isCollapsed: effectiveCollapsed,
              onTap: () {
                context.go('/');
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
            _NavItem(
              icon: Icons.analytics_outlined,
              label: 'Performance',
              isSelected: currentLocation == '/performance',
              isCollapsed: effectiveCollapsed,
              onTap: () {
                context.go('/performance');
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
            _NavItem(
              icon: Icons.gavel_outlined,
              label: 'Fairness Audit',
              isSelected: currentLocation == '/fairness',
              isCollapsed: effectiveCollapsed,
              onTap: () {
                context.go('/fairness');
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
            _NavItem(
              icon: Icons.security_outlined,
              label: 'Governance',
              isSelected: currentLocation == '/governance',
              isCollapsed: effectiveCollapsed,
              onTap: () {
                context.go('/governance');
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapseToggle(bool isCollapsed) {
    return InkWell(
      onTap: () => setState(() => isSidebarCollapsed = !isSidebarCollapsed),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(13),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment:
              isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(
              isCollapsed ? Icons.chevron_right : Icons.chevron_left,
              color: Colors.white70,
              size: 20,
            ),
            if (!isCollapsed) ...[
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLogo({required bool isCollapsed}) {
    return Row(
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
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
        if (!isCollapsed) ...
          [
            Expanded(
              child: ClipRect(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'TalentMatch AI',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isCollapsed;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    this.isCollapsed = false,
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
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: isCollapsed ? 0 : 16,
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withAlpha(26) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment:
                isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF38BDF8)
                    : Colors.white60,
                size: 24,
              ),
              if (!isCollapsed) ...
                [
                  Expanded(
                    child: ClipRect(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            color: isSelected ? Colors.white : Colors.white60,
                            fontSize: 16,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
