import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/screen/overview_screen.dart';
import '../../features/dashboard/presentation/screen/performance_screen.dart';
import '../../features/dashboard/presentation/screen/fairness_screen.dart';
import '../../features/dashboard/presentation/screen/governance_screen.dart';
import '../../features/dashboard/presentation/widgets/main_scaffold.dart';
import '../logging/nav_observer.dart';

final router = GoRouter(
  initialLocation: '/',
  observers: [AppNavObserver()],
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'Overview',
          builder: (context, state) => const OverviewScreen(),
        ),
        GoRoute(
          path: '/performance',
          name: 'Performance',
          builder: (context, state) => const PerformanceScreen(),
        ),
        GoRoute(
          path: '/fairness',
          name: 'Fairness',
          builder: (context, state) => const FairnessScreen(),
        ),
        GoRoute(
          path: '/governance',
          name: 'Governance',
          builder: (context, state) => const GovernanceScreen(),
        ),
      ],
    ),
  ],
);
