import 'package:flutter/material.dart';

class McSetState extends StatefulWidget {
  final bool initialValue;
  final Widget Function(bool value, Function(bool newBool) setState) builder;

  const McSetState({
    Key? key,
    this.initialValue = true,
    required this.builder,
  }) : super(key: key);

  @override
  _McBoolToggleState createState() => _McBoolToggleState();
}

class _McBoolToggleState extends State<McSetState> {
  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  late bool value;
  @override
  Widget build(BuildContext context) {
    return widget.builder(value, (newBool) {
      setState(() {
        value = newBool;
      });
    });
  }
}
