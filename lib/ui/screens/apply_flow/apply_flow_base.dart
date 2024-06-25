import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_container.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_stepper.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class ApplyFlowBase extends StatelessWidget {
  final Function() onContinue;
  final List<Widget> children;
  final int? step;

  const ApplyFlowBase({
    super.key,
    required this.onContinue,
    required this.children,
    this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: McColors.orange,
                    height: 270,
                    width: double.infinity,
                    padding: const EdgeInsets.all(kSpacing),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const McVSpacer(),
                        Row(
                          children: [
                            McIconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        // McVSpacer(),
                        const McText.bodyM(
                          'Apply securely',
                          color: McColors.white,
                        ),
                        const McVSpacer(),
                        if (step != null)
                          McStepper(
                            steps: ['Personal', 'Employment', 'Family', 'Docs'],
                            currentStep: step!,
                          )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  McContainer(
                    margin: const EdgeInsets.all(kSpacing).copyWith(top: 200),
                    child: Column(
                      children: children,
                    ),
                  ),
                  const McVSpacer(30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                    child: McButton(
                      'Continue',
                      color: McColors.black,
                      expanded: true,
                      onPressed: onContinue,
                    ),
                  ),
                  const McVSpacer(30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
