import 'package:flutter/material.dart';

class McGestureHandler extends StatelessWidget {
  const McGestureHandler({
    super.key,
    this.dissmissKeyBoard = false,
    this.absorbing = false,
    required this.child,
  });
  final bool dissmissKeyBoard;
  final bool absorbing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (dissmissKeyBoard) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: AbsorbPointer(absorbing: absorbing, child: child),
    );
  }
}
