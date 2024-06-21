import 'package:bw_home_bridge/backend/mock_data/property_mock.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/home_search_f_ilter.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/property_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///
  var propertyList = generateMockProperties(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kSpacing).copyWith(bottom: 0),
            child: Column(
              children: [
                const HomeSearchFIlter(),
                const McVSpacer(),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: propertyList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return PropertyCard(property: propertyList[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
