import 'package:flutter/material.dart';

class McHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const McHover({Key? key, required this.builder}) : super(key: key);

  @override
  _McHoverState createState() => _McHoverState();
}

class _McHoverState extends State<McHover> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
