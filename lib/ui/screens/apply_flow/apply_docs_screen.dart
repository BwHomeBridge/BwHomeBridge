import 'package:bw_home_bridge/ui/screens/apply_flow/apply_flow_base.dart';
import 'package:bw_home_bridge/ui/widgets/mc_file_uploader.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class ApplyDocsScreen extends StatelessWidget {
  const ApplyDocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplyFlowBase(
      step: 3,
      children: [
        McFileUploader(
          documentName: 'Certified Omang copy',
        ),
        McVSpacer(),
        McFileUploader(
          documentName: 'Marriage certificate',
        ),
        McVSpacer(),
        McFileUploader(
          documentName: 'Certified spouse Omang copy',
        ),
        McVSpacer(),
        McFileUploader(
          documentName: 'Financial reference',
        ),
        McVSpacer(),
        Column(
          children: [
            McFileUploader(
              documentName: 'Previous purchase affidavit',
            ),
            McVSpacer(5),
            McText(
              'Declaring if you have purchased BHC house before or not',
              style: TextStyle(fontSize: 12, color: McColors.secondary),
            )
          ],
        ),
      ],
      onContinue: () {
        // AppRoutes.openNamed(context, AppRoutes.applyFlowEmployment);
      },
    );
  }
}
