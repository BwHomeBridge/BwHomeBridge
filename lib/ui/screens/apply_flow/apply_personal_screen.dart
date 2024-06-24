import 'package:bw_home_bridge/ui/screens/apply_flow/apply_flow_base.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/mc_router.dart';
import 'package:flutter/material.dart';

class ApplyPersonalScreen extends StatelessWidget {
  const ApplyPersonalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ApplyFlowBase(
      step: 0,
      children: [
        McTextFormField(
          labelText: 'Full name',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Omang/ID or Passport Number',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Postal',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Physical Address',
        ),
        McVSpacer(),
        McTextFormField(
          labelText: 'Email',
        ),
      ],
      onContinue: () {
        AppRoutes.openApplyFlowEmployement(context);
      },
    );
  }
}
