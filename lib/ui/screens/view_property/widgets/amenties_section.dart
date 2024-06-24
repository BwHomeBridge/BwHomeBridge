import 'package:bw_home_bridge/ui/screens/view_property/widgets/amentiy_item.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class AmentiesSection extends StatelessWidget {
  const AmentiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacing),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AmentiyItem(
            iconName: 'Bed.png',
            text: '3 Beds',
          ),
          AmentiyItem(
            iconName: 'Bath.png',
            text: '1 Bathrooms',
          ),
          AmentiyItem(
            iconName: 'Square-meters.png',
            text: '300 sqm',
          ),
        ],
      ),
    );
  }
}
