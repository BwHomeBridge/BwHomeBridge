import 'package:bw_home_bridge/ui/screens/apply_flow/apply_flow_base.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ApplyFamilyScreen extends StatelessWidget {
  const ApplyFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplyFlowBase(
      step: 2,
      children: [
        McTextFormField(
          labelText: 'Next of kin Name',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Postal Address',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Cellphone',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Employer\'s Name',
        ),
      ],
      onContinue: () {
        AppRoutes.openNamed(context, AppRoutes.applyFlowDocs);
      },
    );
  }
}
