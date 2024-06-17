import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';

class McNoContent extends StatelessWidget {
  const McNoContent({
    super.key,
    this.message = 'No content',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: McText.h2M(message),
    );
  }
}
