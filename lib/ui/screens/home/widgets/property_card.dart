import 'package:animated_card/animated_card.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/view_property/view_property_screen.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.openViewProperty(context, property);
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.bottom,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 11 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: property.id,
                    child: CachedNetworkImage(
                      imageUrl: property.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    McText.bodyM(
                      property.title,
                    ),
                    const SizedBox(height: 4),
                    // Flexible(child: Text(property.location.toString())),
                    const SizedBox(height: 4),
                    Text('P${property.price}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
