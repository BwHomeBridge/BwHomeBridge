import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_range_slider.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class PriceRangeSelector extends StatelessWidget {
  const PriceRangeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McText.h3M('Price range'),
        McRangeSlider(
          initialRangeValues: RangeValues(1000, 50000),
          min: 0,
          max: 100000,
          onChanged: (range) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            McText.body('BWP 500'),
            McHSpacer(kSpacing),
            McText.body('BWP 300000'),
          ],
        )
      ],
    );
  }
}
