import 'package:bw_home_bridge/ui/widgets/mc_radio_list_tile.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';

class ListingTypeSelector extends StatelessWidget {
  const ListingTypeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McVSpacer(),
        McText.h3M('Listing type'),
        McRadioListTile(
          onChanged: (value) {},
          value: ListingType.all,
          groupValue: ListingType.all,
          title: ListingType.all.name,
        ),
        McRadioListTile(
          onChanged: (value) {},
          value: ListingType.all,
          groupValue: ListingType.rent,
          title: ListingType.rent.name,
        ),
        McRadioListTile(
          onChanged: (value) {},
          value: ListingType.all,
          groupValue: ListingType.sale,
          title: ListingType.sale.name,
        ),
      ],
    );
  }
}
