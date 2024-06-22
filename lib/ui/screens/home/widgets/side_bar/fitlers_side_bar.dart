import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/location_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/num_bathrooms_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/num_bedrooms_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/price_range_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/property_size_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/property_type_selector.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/widgets/listing_type_selector.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:bw_home_bridge/utils/mc_dialogs.dart';
import 'package:flutter/material.dart';

Future<void> showPropertyFilterSideBar(BuildContext context) async {
  return McDialogs.leftSideBarDialog(
    context,
    child: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 55,
                    )
                  ],
                ),
                //
                McVSpacer(),
                LocationSelector(),
                PropertyTypeSelector(),

                ListingTypeSelector(),

                McVSpacer(),
                PriceRangeSelector(),

                NumBedroomsSelector(),
                NumBathroomsSelector(),
                PropertySizeSelector(),

                McVSpacer(50)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: McColors.secondary2,
              ),
              width: 260,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  McButton(
                    'Show properties',
                    // expanded: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
