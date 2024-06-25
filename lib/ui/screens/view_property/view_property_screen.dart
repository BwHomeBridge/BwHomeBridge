import 'package:animated_card/animated_card.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/screens/view_property/widgets/amenties_section.dart';
import 'package:bw_home_bridge/ui/screens/view_property/widgets/list_agent_section.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_map.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewPropertyScreen extends StatelessWidget {
  final Property property;

  const ViewPropertyScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
                    Hero(
                      tag: property.id,
                      child: Container(
                        height: 350,
                        padding:
                            const EdgeInsets.all(kSpacing).copyWith(top: 40),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                property.photo),
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
                    ),

                    ///
                    const AmentiesSection(),

                    //
                    AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kSpacing),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const McVSpacer(),
                            ListAgentSection(
                              property: property,
                            ),
                            const McVSpacer(),
                            const McText.h3M('Gaborone'),
                            const McText.body('Phase 2'),
                            const McVSpacer(),
                            const McText.h3M('Description'),
                            const McVSpacer(10),
                            McText.body(property.description!)
                          ],
                        ),
                      ),
                    ),
                    const McVSpacer(),
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          McMap(
                            initialCameraPosition: CameraPosition(
                              target: property.location,
                            ),
                            markers: <Marker>{
                              Marker(
                                markerId: MarkerId(property.id.toString()),
                                position: property.location,
                              )
                            },
                            onMapCreated: (controller) {},
                          ),
                          IgnorePointer(
                            child: Container(
                              height: 400,
                              width: double.infinity,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const McVSpacer(),
                  ],
                ),
              ),
            ),

            ///
            Container(
              padding: const EdgeInsets.all(kSpacing),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 199, 186, 186),
                  spreadRadius: -10,
                  blurRadius: 20,
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      McText.body('Total price'),
                      McText.h3M('BWP 400000'),
                    ],
                  ),
                  const McHSpacer(kSpacing),
                  McButton(
                    'Apply',
                    onPressed: () {
                      AppRoutes.openApplyFlowPersonal(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
