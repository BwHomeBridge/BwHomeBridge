import 'package:bw_home_bridge/ui/screens/on_boarding/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'mc_route_page.dart';
import 'mc_shell_route.dart';

class McRouter {
  const McRouter._();

  // static final _fishingDepatureNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    // initialLocation: AppRoutes.login,

    redirect: (context, state) {
      return null;
    },
    routes: [
      McRoutePage(
        path: '/',
        child: SplashScreen(),
      ),
    ],
  );
}
