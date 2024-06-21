import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class McVSpacer extends StatelessWidget {
  const McVSpacer([this.space = kSpacing, Key? key]) : super(key: key);

  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
