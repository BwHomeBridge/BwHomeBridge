import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ListAgentSection extends StatelessWidget {
  final Property property;
  const ListAgentSection({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            McText.h3M('Listing agent'),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image(
                      image: AssetImage(
                        'assets/images/user1.png',
                      ),
                    ),
                  ),
                  McHSpacer(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      McText.bodyM('Mrs Samantha'),
                      McText.body('BHC'),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                AppRoutes.openPropertyUserChat(context);
              },
              icon: Image(
                height: 40,
                image: AssetImage('assets/icons/chat.png'),
              ),
            )
          ],
        )
      ],
    );
  }
}
