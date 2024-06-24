import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// class RouteInfo {
//   const RouteInfo._(this.name, this.path);
//   final String name;
//   final String path;

//   RouteInfo(this.name, this.path);
// }

class AppRoutes {
  AppRoutes._();

  /// GENERIC
  static const String root = '/';
  static const String notFound = '/not-found';
  static const String login = 'login';
  static const String onBoarding = 'onBoarding';

  //
  static const String dashboard = 'dashboard';
  static const String home = 'home';

  static const String viewPropert = 'view-property';

  static const String mortgageCalculator = 'mortgageCalculator';
  static const String reportDesk = 'report-desk';

  static const String applyFlowPersonal = 'apply-flow-personal';
  static const String applyFlowEmployment = 'apply-flow-employment';
  static const String applyFlowFamily = 'apply-flow-family';
  static const String applyFlowDocs = 'apply-flow-docs';

  /// DO NOT USE >> UNRELIABLE
  static bool isActiveRouteName(BuildContext context, String routeName) {
    return GoRouterState.of(context).name == routeName;
  }

  ///
  static String activeUrl(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  static String? getQueryParam(BuildContext context, String name) {
    return GoRouterState.of(context).uri.queryParameters[name];
  }

  static String? getParam(BuildContext context, String name) {
    return GoRouterState.of(context).pathParameters[name];
  }

  static void openNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? data,
  }) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: data,
    );
  }

  static void openLogin(BuildContext context) {
    openNamed(context, login);
  }

  static void openOnBoarding(BuildContext context) {
    openNamed(context, onBoarding);
  }

  static void openViewProperty(BuildContext context, Property property) {
    openNamed(
      context,
      viewPropert,
      pathParameters: {kPropertyId: property.id},
      data: property,
    );
  }

  static void openApplyFlowPersonal(BuildContext context) {
    var propertyId = getParam(context, kPropertyId)!;
    openNamed(
      context,
      applyFlowPersonal,
      pathParameters: {kPropertyId: propertyId},
    );
  }

  static void openApplyFlowEmployement(BuildContext context) {
    var propertyId = getParam(context, kPropertyId)!;
    openNamed(
      context,
      applyFlowEmployment,
      pathParameters: {kPropertyId: propertyId},
    );
  }

  static void openApplyFlowFamily(BuildContext context) {
    var propertyId = getParam(context, kPropertyId)!;
    openNamed(
      context,
      applyFlowFamily,
      pathParameters: {kPropertyId: propertyId},
    );
  }

  static void openApplyFlowDocs(BuildContext context) {
    var propertyId = getParam(context, kPropertyId)!;
    openNamed(
      context,
      applyFlowDocs,
      pathParameters: {kPropertyId: propertyId},
    );
  }
}
