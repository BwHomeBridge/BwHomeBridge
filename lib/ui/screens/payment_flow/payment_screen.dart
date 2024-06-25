import 'package:bw_home_bridge/ui/screens/payment_flow/widgets/card_back.dart';
import 'package:bw_home_bridge/ui/screens/payment_flow/widgets/card_details_form.dart';
import 'package:bw_home_bridge/ui/screens/payment_flow/widgets/card_front.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_stepper.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();

          // show card front on unfocus
          if (cardKey.currentState!.isFront) return;
          cardKey.currentState?.toggleCard();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ///backgroud
                Column(
                  children: [
                    Container(
                      color: McColors.orange,
                      height: 230,
                      width: double.infinity,
                      padding: const EdgeInsets.all(kSpacing),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const McVSpacer(),
                          Row(
                            children: [
                              McIconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                          // McVSpacer(),
                          const McText.bodyM(
                            'Pay securely',
                            color: McColors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                /// top
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing)
                      .copyWith(top: 130),
                  child: Column(
                    children: [
                      FlipCard(
                        key: cardKey,
                        flipOnTouch: false,
                        front: CardFront(
                          cardNumber: cardNumberController.text,
                          expiryDate: expiryDateController.text,
                          cardHolderName: cardHolderNameController.text,
                        ),
                        back: CardBack(cvv: cvvController.text),
                      ),
                      SizedBox(height: 20),
                      CardDetailsForm(
                        cardNumberController: cardNumberController,
                        expiryDateController: expiryDateController,
                        cvvController: cvvController,
                        cardHolderNameController: cardHolderNameController,
                        onFocusChange: (isShowFront) {
                          if (isShowFront) {
                            if (cardKey.currentState!.isFront) return;
                            cardKey.currentState?.toggleCard();
                          } else {
                            if (!cardKey.currentState!.isFront) return;
                            cardKey.currentState?.toggleCard();
                          }
                        },
                        onUpdate: () {
                          setState(() {});
                        },
                      ),

                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            McText.h3M('Total: '),
                            McText.h1M(
                              'BWP502.00',
                              color: McColors.orange,
                            ),
                          ],
                        ),
                      ),

                      ///
                      McVSpacer(),
                      McButton(
                        'Pay',
                        color: McColors.black,
                        expanded: true,
                        onPressed: () {
                          AppRoutes.openApplyFlowPaymentSuccess(context);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
