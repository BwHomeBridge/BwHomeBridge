import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class McIconButton extends StatelessWidget {
  final Function() onPressed;

  const McIconButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: McColors.black,
      ),
      child: Center(
        child: IconButton(
          alignment: Alignment.center,
          icon: const Icon(
            Icons.arrow_back,
            size: 18,
          ),
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}
