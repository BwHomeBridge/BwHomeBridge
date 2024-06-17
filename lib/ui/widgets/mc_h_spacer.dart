import 'package:flutter/material.dart';

class McHSpacer extends StatelessWidget {
  const McHSpacer(this.space, {Key? key}) : super(key: key);

  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
