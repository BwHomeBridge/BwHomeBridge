import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';

class IssueStatusPill extends StatelessWidget {
  const IssueStatusPill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber[200], borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: McText.body('on-going'),
    );
  }
}
