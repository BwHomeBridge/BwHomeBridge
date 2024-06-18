import 'package:bw_home_bridge/backend/helper_classes/config.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_screen_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            // height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xB2FD7575),
                  Color(0xCC961010),
                  Color(0xDB540101),
                  Colors.black
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const McVSpacer(100),

                  ///
                  const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo2.png'),
                      ),
                      McVSpacer(20),
                      McText.h1M(
                        'Botswana Housing\nCorporation',
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  ///
                  const McVSpacer(20),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      McButton(
                        'let’s start',
                        expanded: true,
                        color: McColors.secondary,
                        onPressed: () {},
                      ),
                      const McVSpacer(30),
                      const McText.bodyM(
                        'Made by HomeBridge',
                        color: Colors.white,
                      ),
                      McText.bodyM(
                        Config.appsettings.version,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
