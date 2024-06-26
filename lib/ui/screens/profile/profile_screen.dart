import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image(
                          image: CachedNetworkImageProvider(
                            'https://img.freepik.com/premium-photo/beautiful-black-woman-beautiful-image-ai-generated-art_923092-235.jpg?w=1800',
                          ),
                        ),
                      ),
                    ),
                    McHSpacer(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        McText.h1M('Katlego moremi'),
                        McText.body('Gaborone'),
                      ],
                    ),
                  ],
                ),
                McVSpacer(40),

                ///
                ProfileBtn(
                  iconData: Icons.home,
                  title: 'My property',
                  onTap: () {
                    AppRoutes.openNamed(context, AppRoutes.myProperties);
                  },
                ),
                ProfileBtn(
                  iconData: Icons.book,
                  title: 'Bookmarked properties',
                  onTap: () {},
                ),
                ProfileBtn(
                  iconData: Icons.person,
                  title: 'Account',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileBtn extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function() onTap;

  const ProfileBtn({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: McColors.grey,
              size: 30,
            ),
            McHSpacer(10),
            McText.body2(title),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: McColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
