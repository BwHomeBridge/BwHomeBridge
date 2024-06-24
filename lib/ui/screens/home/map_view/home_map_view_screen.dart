import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/home/map_view/widgets/map_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_map.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapViewScreen extends StatelessWidget {
  final List<Property> properties;

  const HomeMapViewScreen({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    ///
    var homeCubit = context.read<HomeCubit>();
    var mapService = homeCubit.homeMapService;

    return Stack(
      children: [
        McMap(
          markers: homeCubit.propertyMakers,
          initialCameraPosition: CameraPosition(
            target: properties.isNotEmpty
                ? properties[mapService.pageController.initialPage].location
                : LatLng(0, 0),
          ),
          onMapCreated: (controller) {
            mapService.mapController = controller;
          },
        ),

        Positioned(
          right: 20,
          top: 20,
          child: McIconButton(
            onPressed: () {
              context.read<HomeCubit>().toggleView(ViewType.gridView);
            },
          ),
        ),

        ///
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Container(
            height: 200,
            child: PageView.builder(
              controller: mapService.pageController,
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return MapCard(
                  property: properties[index],
                  index: index,
                );
              },
              onPageChanged: (index) {
                mapService.animateToLocation(properties[index].location);
              },
            ),
          ),
        )
      ],
    );
  }
}
