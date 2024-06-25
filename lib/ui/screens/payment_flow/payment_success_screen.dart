import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_ticket_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_title_value.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/datetime_extentions.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TicketCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    McText.h2M(
                      'Payment successful',
                    ),
                    McVSpacer(),
                    McTitleValue(
                      title: 'Payment ID: ',
                      value: '09113056',
                    ),
                    McTitleValue(
                      title: 'Payment Date',
                      value: DateTime.now().toDayMonthYear(),
                    ),
                    McText.body(
                        'A confirmation email will\nbe sent to you shortly.'),
                  ],
                ),
              ),
            ),
            McVSpacer(50),
            McButton(
              'Done',
              color: McColors.black,
              expanded: true,
              onPressed: () {
                AppRoutes.openNamed(context, AppRoutes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
