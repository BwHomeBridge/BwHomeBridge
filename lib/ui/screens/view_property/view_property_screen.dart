import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewPropertyScreen extends StatelessWidget {
  final Property property;

  const ViewPropertyScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: property.id,
              child: Container(
                height: 350,
                padding: EdgeInsets.all(kSpacing).copyWith(top: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(property.images.first),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        McIconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
