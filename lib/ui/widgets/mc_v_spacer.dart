import 'package:flutter/material.dart';

class McVSpacer extends StatelessWidget {
  const McVSpacer(this.space, {Key? key}) : super(key: key);

  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
