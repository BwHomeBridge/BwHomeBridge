import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  final String cvv;

  CardBack({required this.cvv});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 170,
      decoration: BoxDecoration(
        color: McColors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'CVV',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              cvv.isNotEmpty ? cvv : 'XXX',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
