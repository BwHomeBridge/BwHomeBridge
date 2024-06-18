import 'package:bw_home_bridge/ui/screens/on_boarding/widgets/on_boarding_layout.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  final List<OnBoardData> pagesData = [
    const OnBoardData(
      index: 0,
      bgColor: McColors.white,
      heroImage: 'onboard_hero_1.png',
      title: 'Welcome to Botswana\nHousing Corporation',
      info:
          'A new era of property management and home-ownership with Botswana Housing Corporation. Your journey starts here',
    ),
    const OnBoardData(
      index: 1,
      bgColor: McColors.primary,
      heroImage: 'onboard_hero_2.png',
      title: 'Effortless Maintenance\nReporting',
      info:
          'Experiencing a maintenance issue? Report it quickly and track the resolution right from your app. Our customer care service is here to ensure your living experience is smooth and hassle-free.',
    ),
    const OnBoardData(
      index: 2,
      bgColor: McColors.secondary,
      heroImage: 'onboard_hero_3.png',
      title: 'Smart Mortgage\nCalculator',
      info:
          'Take the guesswork out of home financing. Use our mortgage calculator to plan your budget, understand your repayment options, and make informed decisions for a secure future.',
    ),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe.builder(
            // key: Key(page.toString()),
            itemCount: pagesData.length,
            itemBuilder: (context, index) {
              var pageData = pagesData[index];
              return OnBoardingLayout(
                index: index,
                bgColor:
                    page == pageData.index ? McColors.white : pageData.bgColor,
                heroImage: pageData.heroImage,
                title: pageData.title,
                info: pageData.info,
                activeIndex: page,
                onNext: () {
                  // if (page < pagesData.length - 1) {
                  liquidController.animateToPage(page: page + 1);
                  // }
                },
                onBack: () {
                  // if (page != 0) {
                  liquidController.animateToPage(page: page - 1);
                  // }
                },
              );
            },
            positionSlideIcon: 0.68,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            ),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            preferDragFromRevealedArea: true,
            enableLoop: false,
            ignoreUserGestureWhileAnimating: true,
          ),
        ],
      ),
    );
  }
}
