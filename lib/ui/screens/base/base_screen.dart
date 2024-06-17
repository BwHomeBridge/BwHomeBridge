import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  final String title;

  const BaseScreen({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  get idVrstaOcevidnika => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
