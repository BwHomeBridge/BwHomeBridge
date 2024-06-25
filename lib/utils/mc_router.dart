import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/apply_flow/apply_docs_screen.dart';
import 'package:bw_home_bridge/ui/screens/apply_flow/apply_employment_screen.dart';
import 'package:bw_home_bridge/ui/screens/apply_flow/apply_family_screen.dart';
import 'package:bw_home_bridge/ui/screens/apply_flow/apply_personal_screen.dart';
import 'package:bw_home_bridge/ui/screens/chat/chat_screen.dart';
import 'package:bw_home_bridge/ui/screens/dashboard/dashboard_screen.dart';
import 'package:bw_home_bridge/ui/screens/faq/faq_screen.dart';
import 'package:bw_home_bridge/ui/screens/home/home_screen.dart';
import 'package:bw_home_bridge/ui/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:bw_home_bridge/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:bw_home_bridge/ui/screens/on_boarding/splash_screen.dart';
import 'package:bw_home_bridge/ui/screens/report_desk/report_desk_screen.dart';
import 'package:bw_home_bridge/ui/screens/tenders/tenders_screen.dart';
import 'package:bw_home_bridge/ui/screens/view_property/view_property_screen.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/debugBro.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          McRoutePage(
            name: AppRoutes.faq,
            path: 'faq',
            child: FaqScreen(),
          ),
          McRoutePage(
            name: AppRoutes.tenders,
            path: 'tenders',
            child: TendersScreen(),
          ),
        ],
      ),

      /// Home
      McRoutePage(
        name: AppRoutes.home,
        path: '/home',
        useBaseScreen: true,
        child: HomeScreen(),
        routes: [
          McRoutePage(
            name: AppRoutes.viewPropert,
            path: 'property/:$kPropertyId',
            useBaseScreen: false,
            builder: (context, state) {
              Property? property;
              if (state.extra != null) {
                property = state.extra as Property;
              } else {
                context.read<HomeCubit>().state.maybeWhen(
                      loaded: (properties, viewType) {
                        property = properties.firstWhereOrNull(
                          (p) => p.id == state.pathParameters[kPropertyId],
                        );
                      },
                      orElse: () {},
                    );
              }

              return ViewPropertyScreen(property: property!);
            },
            routes: [
              McRoutePage(
                name: AppRoutes.applyFlowPersonal,
                path: 'apply/personal',
                child: ApplyPersonalScreen(),
                routes: [
                  McRoutePage(
                    name: AppRoutes.applyFlowEmployment,
                    path: 'employment',
                    child: ApplyEmploymentScreen(),
                    routes: [
                      McRoutePage(
                        name: AppRoutes.applyFlowFamily,
                        path: 'family',
                        child: ApplyFamilyScreen(),
                        routes: [
                          McRoutePage(
                            name: AppRoutes.applyFlowDocs,
                            path: 'docs',
                            child: ApplyDocsScreen(),
                            routes: [],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///
              McRoutePage(
                name: AppRoutes.propertyChat,
                path: 'property-chat',
                builder: (context, state) {
                  final propertyId = state.pathParameters[kPropertyId];

                  return ChatScreen(
                    propertyId: propertyId!,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
