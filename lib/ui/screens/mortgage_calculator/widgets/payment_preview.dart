import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentPreview extends StatelessWidget {
  final double paymentEstimate;

  const PaymentPreview({
    super.key,
    required this.paymentEstimate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.symmetric(
        vertical: kSpacing,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 199, 186, 186),
            spreadRadius: -30,
            blurRadius: 80,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              )
            ],
          ),
          //
          McText.h3('Estimated payment'),
          McVSpacer(kSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              McText(
                'BWP ${paymentEstimate.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              McText.bodyM(' /mt')
            ],
          ),
        ],
      ),
    );
  }
}
