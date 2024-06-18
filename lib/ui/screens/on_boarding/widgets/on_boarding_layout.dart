import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingLayout extends StatelessWidget {
  final int index;
  final int activeIndex;
  final Color bgColor;
  final String heroImage;
  final String title;
  final String info;
  final Function() onNext;
  final Function() onBack;

  const OnBoardingLayout({
    super.key,
    required this.index,
    required this.bgColor,
    required this.heroImage,
    required this.title,
    required this.info,
    required this.activeIndex,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
                McVSpacer(kSpacing),
                Expanded(
                  flex: 4,
                  child: Image(
                    image: AssetImage('assets/images/$heroImage'),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: kSpacing,
                      right: kSpacing,
                      bottom: kSpacing,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        McVSpacer(30),
                        McText.h1M(title),
                        McVSpacer(20),
                        McText.body(info),
                        McVSpacer(20),
                        Row(
                          mainAxisAlignment: (index != 0)
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                          children: [
                            if (index != 0)
                              McButton(
                                'Back',
                                color: McColors.black,
                                onPressed: onBack,
                              ),
                            Hero(
                              tag: 'next',
                              child: McButton(
                                'Next',
                                color: McColors.black,
                                onPressed: onNext,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            ///
            // Positioned(
            //   right: 0,
            //   child: Image(
            //     image: AssetImage('assets/images/next$index.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class OnBoardData {
  final int index;
  final Color bgColor;
  final String heroImage;
  final String title;
  final String info;

  const OnBoardData({
    required this.index,
    required this.bgColor,
    required this.heroImage,
    required this.title,
    required this.info,
  });
}
