import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/widgets/mc_web_container.dart';

class McShellRoute extends ShellRoute {
  McShellRoute({
    required ShellRouteBuilder builder,
    List<RouteBase> routes = const <RouteBase>[],
  }) : super(
          builder: (context, state, child) {
            var finalChild = builder(context, state, child);

            return McWebContainer(
              child: finalChild,
            );
          },
          routes: routes,
        );
}

/// The widget builder for [ShellRoute].
typedef ShellRouteBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
  Widget child,
);
