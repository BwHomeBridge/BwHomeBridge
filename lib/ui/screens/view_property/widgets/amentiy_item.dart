import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class AmentiyItem extends StatelessWidget {
  final String iconName;
  final String text;

  const AmentiyItem({
    super.key,
    required this.iconName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage('assets/icons/$iconName'),
          size: 25,
          color: McColors.primary,
        ),
        McHSpacer(5),
        McText.bodyM(text),
        // McHSpacer(kSpacing),
      ],
    );
  }
}
