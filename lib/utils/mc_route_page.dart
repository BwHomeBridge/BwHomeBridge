import 'dart:async';

import 'package:bw_home_bridge/ui/screens/base/base_screen.dart';
import 'package:bw_home_bridge/ui/widgets/mc_web_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class McRoutePage extends GoRoute {
  McRoutePage({
    required super.path,
    GlobalKey<NavigatorState>? navigatorKey,
    super.parentNavigatorKey,
    Widget? child,
    GoRouterWidgetBuilder? builder,
    // GoRouterPageBuilder? pageBuilder,
    String title = '',
    bool useBaseScreen = false,
    super.name,
    ExitCallback? onPop,
    super.redirect,
    super.routes,
  })  : assert(child != null || builder != null),
        super(
          onExit: onPop,
          pageBuilder: (context, state) {
            var finalChild = child;

            if (builder != null) finalChild ??= builder(context, state);

            return CustomTransitionPage(
              child: McWebContainer(
                child: useBaseScreen
                    ? BaseScreen(
                        title: title,
                        child: finalChild!,
                      )
                    : finalChild!,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInExpo).animate(animation),
                  child: child,
                );
              },
            );
          },
        );
}

typedef GoRouterRedirect = FutureOr<String?> Function(
    BuildContext context, GoRouterState state);

typedef ExitCallback = FutureOr<bool> Function(
    BuildContext context, GoRouterState state);

typedef GoRouterWidgetBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
);

typedef GoRouterPageBuilder = Page<dynamic> Function(
  BuildContext context,
  GoRouterState state,
);
