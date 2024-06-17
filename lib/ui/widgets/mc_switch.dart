import 'package:flutter/material.dart';

import '../../utils/mc_colors.dart';
import 'mc_container.dart';
import 'mc_text.dart';

class McSwitch extends StatefulWidget {
  const McSwitch({
    super.key,
    required this.title,
    required this.initialvalue,
    required this.onChanged,
  });

  final String title;
  final bool initialvalue;

  final ValueChanged<bool> onChanged;

  @override
  State<McSwitch> createState() => _McSwitchState();
}

class _McSwitchState extends State<McSwitch> {
  bool isOn = false;

  @override
  void initState() {
    isOn = widget.initialvalue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return McContainer(
      boxShadow: null,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      border: Border.all(width: 1, color: McColors.lightGrey),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          McText.body(widget.title),
          Switch(
            value: isOn,
            activeColor: Colors.red,
            onChanged: (bool value) {
              widget.onChanged(value);

              setState(() {
                isOn = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
