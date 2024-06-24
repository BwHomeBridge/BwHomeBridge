import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/view_property/view_property_screen.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapCard extends StatelessWidget {
  final Property property;
  final int index;
  const MapCard({
    super.key,
    required this.property,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ///
    var homeCubit = context.read<HomeCubit>();
    var mapService = homeCubit.homeMapService;

    return AnimatedBuilder(
      animation: mapService.pageController,
      builder: (context, child) {
        double value = 1.0;
        if (mapService.pageController.position.haveDimensions) {
          value = mapService.pageController.page! - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return InkWell(
          onTap: () {
            AppRoutes.openViewProperty(context, property);
          },
          child: Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 170,
              width: Curves.easeOut.transform(value) * 300,
              child: child,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: property.id,
                  child: CachedNetworkImage(
                    imageUrl: property.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(kSpacing),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(.5),
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  McText.h3M(
                    property.name,
                    color: McColors.white,
                  ),
                  McText.body(
                    'P' + property.price.toStringAsFixed(2),
                    color: McColors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
