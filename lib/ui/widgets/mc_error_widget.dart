import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';

class McErrorWidget extends StatelessWidget {
  const McErrorWidget({
    super.key,
    this.message = 'Error, Some developer messed up',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const McText.h1M(':('),
            McText.h2M(message),
          ],
        ),
      ),
    );
  }
}
