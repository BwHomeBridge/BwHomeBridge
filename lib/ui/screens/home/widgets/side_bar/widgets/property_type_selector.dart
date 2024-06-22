import 'package:bw_home_bridge/ui/widgets/mc_radio_list_tile.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';

class PropertyTypeSelector extends StatelessWidget {
  const PropertyTypeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McVSpacer(),
        McText.h3M('Property type'),
        McRadioListTile(
          onChanged: (value) {},
          value: PropertyType.all,
          groupValue: PropertyType.all,
          title: PropertyType.all.name,
        ),
        McRadioListTile(
          onChanged: (value) {},
          value: PropertyType.all,
          groupValue: PropertyType.residential,
          title: PropertyType.residential.name,
        ),
        McRadioListTile(
          onChanged: (value) {},
          value: PropertyType.all,
          groupValue: PropertyType.commercial,
          title: PropertyType.commercial.name,
        ),
      ],
    );
  }
}
