import 'package:bw_home_bridge/ui/screens/dashboard/dashboard_screen.dart';
import 'package:bw_home_bridge/ui/screens/home/home_screen.dart';
import 'package:bw_home_bridge/ui/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:bw_home_bridge/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:bw_home_bridge/ui/screens/on_boarding/splash_screen.dart';
import 'package:bw_home_bridge/ui/screens/report_desk/report_desk_screen.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'mc_route_page.dart';

class McRouter {
  const McRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    redirect: (context, state) {
      return null;
    },
    routes: [
      McRoutePage(
        path: '/',
        child: SplashScreen(),
      ),
      McRoutePage(
        name: AppRoutes.onBoarding,
        path: '/onboarding',
        child: OnBoardingScreen(),
      ),

      /// Dashboard
      McRoutePage(
        name: 'dashboard',
        path: '/dashboard',
        useBaseScreen: true,
        child: DashboardScreen(),
        routes: [
          McRoutePage(
            name: AppRoutes.mortgageCalculator,
            path: 'mortgage-calculator',
            child: MortgageCalculatorScreen(),
          ),
          McRoutePage(
            name: AppRoutes.reportDesk,
            path: 'report-desk',
            child: ReportDeskScreen(),
          ),
        ],
      ),

      /// Home
      McRoutePage(
        name: AppRoutes.home,
        path: '/home',
        useBaseScreen: true,
        child: HomeScreen(),
        routes: [],
      ),
    ],
  );
}
