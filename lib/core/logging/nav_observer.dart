import 'package:flutter/material.dart';
import 'app_logger.dart';

class AppNavObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final name = route.settings.name;
    if (name != null && name != 'null') {
      AppLogger.info('📱 ENTERED SCREEN: $name');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final name = newRoute?.settings.name;
    if (name != null && name != 'null') {
      AppLogger.info('📱 REPLACED SCREEN: $name');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final name = route.settings.name;
    if (name != null && name != 'null') {
      AppLogger.info('⬅️ EXIT SCREEN: $name');
    }
  }
}
