import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:flutter/material.dart';

class NumBedroomsSelector extends StatelessWidget {
  const NumBedroomsSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McVSpacer(),
        McText.h3M('Bedrooms'),
      ],
    );
  }
}
