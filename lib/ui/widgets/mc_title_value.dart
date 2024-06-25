import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';

class McTitleValue extends StatelessWidget {
  final String title;
  final String value;

  const McTitleValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4, child: McText.body(title)),
          Expanded(flex: 3, child: McText.bodyM(value)),
        ],
      ),
    );
  }
}
