import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/home_search_f_ilter.dart';
import 'package:bw_home_bridge/ui/screens/home/widgets/property_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeGridViewScreen extends StatelessWidget {
  final List<Property> properties;

  const HomeGridViewScreen({super.key, required this.properties});

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
                Row(
                  children: [
                    Expanded(child: const HomeSearchFIlter()),
                    McHSpacer(10),
                    IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .toggleView(ViewType.mapView);
                        },
                        icon: Icon(Icons.map))
                  ],
                ),
                const McVSpacer(),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: properties.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return PropertyCard(property: properties[index]);
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
