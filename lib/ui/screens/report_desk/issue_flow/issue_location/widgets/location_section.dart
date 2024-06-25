import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McText.h3M('Issue location'),
        McVSpacer(10),
        Row(
          children: [
            LocationBtn(
              isSelected: true,
              iconName: 'circle-home.png',
              title: 'In-Home',
              subtitle: 'I have an issue in my house',
            ),
            McHSpacer(kSpacing),
            LocationBtn(
              isSelected: false,
              iconName: 'circle-communal.png',
              title: 'Communal',
              subtitle: 'This is a public space  issue  ',
            ),
          ],
        )
      ],
    );
  }
}

class LocationBtn extends StatelessWidget {
  final String iconName;
  final String title;
  final String subtitle;

  final bool isSelected;
  const LocationBtn({
    super.key,
    required this.iconName,
    required this.title,
    required this.subtitle,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xffBCB8DC).withOpacity(.25),
          border: isSelected ? Border.all(color: McColors.black) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/icons/$iconName'),
            ),
            McVSpacer(15),
            McText.body2M(title),
            McText.body(subtitle),
          ],
        ),
      ),
    );
  }
}
