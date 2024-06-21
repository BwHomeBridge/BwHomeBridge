import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashBtn(
                  'Mortgage',
                  onPressed: () {
                    AppRoutes.openNamed(
                      context,
                      AppRoutes.mortgageCalculator,
                    );
                  },
                ),
                DashBtn(
                  'Report\ndesk',
                  onPressed: () {
                    AppRoutes.openNamed(
                      context,
                      AppRoutes.reportDesk,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const DashBtn(
    this.text, {
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: onPressed, icon: Icon(Icons.calculate)),
          McText.body(text)
        ],
      ),
    );
  }
}
