import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_ticket_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/datetime_extentions.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class IssueReportSuccessScreen extends StatelessWidget {
  const IssueReportSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TicketCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    McText.h2M(
                      'Request successful',
                    ),
                    McVSpacer(),
                    TitleValue(
                      title: 'Request #no',
                      value: '123',
                    ),
                    TitleValue(
                      title: 'Request Date',
                      value: DateTime.now().toDayMonthYear(),
                    ),
                    TitleValue(
                      title: 'Estimated Response',
                      value: '2 Days',
                    ),
                  ],
                ),
              ),
            ),
            McVSpacer(50),
            McButton(
              'Done',
              color: McColors.black,
              expanded: true,
              onPressed: () {
                AppRoutes.openNamed(context, AppRoutes.reportDesk);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TitleValue extends StatelessWidget {
  final String title;
  final String value;

  const TitleValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4, child: McText.body(title)),
          Expanded(flex: 3, child: McText.bodyM(value)),
        ],
      ),
    );
  }
}
