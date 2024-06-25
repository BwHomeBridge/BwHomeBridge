import 'package:bw_home_bridge/ui/screens/report_desk/issue_flow/issue_location/widgets/location_section.dart';
import 'package:bw_home_bridge/ui/screens/report_desk/issue_flow/issue_location/widgets/my_address_section.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class IssueLocationScreen extends StatelessWidget {
  const IssueLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: SingleChildScrollView(
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
                    McText.h2M('Location'),
                  ],
                ),
                McVSpacer(kSpacing),
                Image(
                  image: AssetImage('assets/images/report_desk_hero.png'),
                ),
                McVSpacer(kSpacing),
                McText.body(
                  'Sorry to hear that you have a problem.\nWe will assist you as soon as possible.',
                ),
                McVSpacer(),
                McVSpacer(),

                //
                MyAddressSection(),
                McVSpacer(),
                McVSpacer(),
                LocationSection(),
                McVSpacer(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  child: McButton(
                    'Continue',
                    expanded: true,
                    color: McColors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
