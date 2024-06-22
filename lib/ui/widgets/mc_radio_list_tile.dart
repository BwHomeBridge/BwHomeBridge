import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class McRadioListTile extends StatelessWidget {
  final dynamic value;

  final dynamic groupValue;

  final Function(dynamic value) onChanged;

  final String title;

  const McRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      activeColor: McColors.primary,
      tileColor: Colors.amber,
      value: value,
      title: McText.body(title),
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
