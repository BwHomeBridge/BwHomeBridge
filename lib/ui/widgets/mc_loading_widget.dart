import 'package:flutter/material.dart';

import '../../utils/mc_colors.dart';

class McLoadingWidget extends StatelessWidget {
  const McLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: McColors.primary,
      ),
    );
  }
}
