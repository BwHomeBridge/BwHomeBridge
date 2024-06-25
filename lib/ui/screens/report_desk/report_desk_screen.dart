import 'package:bw_home_bridge/ui/screens/report_desk/widgets/issue_card.dart';
import 'package:bw_home_bridge/ui/screens/report_desk/widgets/issue_list_builder.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportDeskScreen extends StatelessWidget {
  const ReportDeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRoutes.openNamed(context, AppRoutes.issueLocation);
        },
        child: McText.body('Report'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kSpacing),
            child: Column(
              children: [
                Row(
                  children: [
                    McIconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    McHSpacer(kSpacing),
                    McText.h2M('Report desk'),
                  ],
                ),
                McVSpacer(kSpacing),
                Image(
                  image: AssetImage('assets/images/report_desk_hero.png'),
                ),
                McVSpacer(kSpacing),
                DefaultTabController(
                  length: 3,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabBar(
                          tabs: [
                            Tab(text: 'Reported'),
                            Tab(text: 'Pending'),
                            Tab(text: 'Resolved'),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .8,
                            child: TabBarView(
                              children: [
                                IssueListBuilder(
                                  issues: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                ),
                                IssueListBuilder(
                                  issues: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                ),
                                IssueListBuilder(
                                  issues: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
