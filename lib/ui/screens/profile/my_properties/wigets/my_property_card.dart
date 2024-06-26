import 'package:bw_home_bridge/backend/models/user_property.dart';
import 'package:bw_home_bridge/ui/widgets/mc_container.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyPropertyCard extends StatelessWidget {
  final UserProperty property;

  const MyPropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
      },
      child: McContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Image(
                image: CachedNetworkImageProvider(
                  property.images!.first,
                ),
                fit: BoxFit.cover,
              ),
            ),
            McVSpacer(),
            McText.h3M(property.title)
          ],
        ),
      ),
    );
  }
}
