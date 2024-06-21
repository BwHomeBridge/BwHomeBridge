import 'package:bw_home_bridge/ui/screens/report_desk/widgets/issue_status_pill.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/datetime_extentions.dart';
import 'package:flutter/material.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(kSpacing),
      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    height: 20,
                    width: 20,
                    image: AssetImage('assets/images/issue_arrow.png'),
                  ),
                  McText.bodyM('Issue 1'),
                ],
              ),
              IssueStatusPill()
            ],
          ),
          const McVSpacer(),

          ///

          Row(
            children: [
              McText.body(
                'Created: ${DateTime.now().toDayMonthYear()}',
              ),
            ],
          )
        ],
      ),
    );
  }
}
