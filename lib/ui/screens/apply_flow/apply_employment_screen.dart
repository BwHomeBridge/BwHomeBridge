import 'package:bw_home_bridge/ui/screens/apply_flow/apply_flow_base.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ApplyEmploymentScreen extends StatelessWidget {
  const ApplyEmploymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplyFlowBase(
      step: 1,
      children: [
        McTextFormField(
          labelText: 'Employer\'s Name',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Location',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Occupation',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Postion',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Source of Funds',
        ),
      ],
      onContinue: () {
        AppRoutes.openNamed(context, AppRoutes.applyFlowFamily);
      },
    );
  }
}
