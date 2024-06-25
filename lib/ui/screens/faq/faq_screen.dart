import 'package:bw_home_bridge/backend/serivces/bhc_faq_scraper.dart';
import 'package:bw_home_bridge/ui/screens/faq/widgets/faq_widget.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      McVSpacer(),
                      McIconButton(
                        onPressed: () {},
                      ),
                      McVSpacer(),
                      McText(
                        'BHC\nF.A.Q.',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          color: McColors.primary,
                        ),
                      ),
                      McVSpacer(),
                      McText.body(kFaqSubTitle),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: BhcFaqSraper().fetchFaqs(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());

                    var faqs = snapshot.data!;

                    return FaqWidget(faqs: faqs);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
