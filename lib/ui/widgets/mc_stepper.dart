import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class McStepper extends StatelessWidget {
  final List<String> steps;
  final int currentStep;

  McStepper({required this.steps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: steps.asMap().entries.map((entry) {
        int idx = entry.key;
        String step = entry.value;

        bool isActive = idx <= currentStep;

        var width = MediaQuery.of(context).size.width * .125;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: idx == 0
              ? CrossAxisAlignment.start
              : (idx == steps.length - 1)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.center,
          children: [
            McText.bodyM(
              step,
              color: McColors.white,
            ),
            McVSpacer(8),
            Row(
              children: [
                if (idx != 0)
                  Container(
                    width: width,
                    height: 3,
                    color: isActive ? McColors.black : Colors.white,
                  ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: isActive ? McColors.black : Colors.white,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: isActive ? McColors.black : Colors.white,
                  ),
                ),
                if (idx != steps.length - 1)
                  Container(
                    width: width,
                    height: 3,
                    color: isActive ? McColors.black : Colors.white,
                  ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
