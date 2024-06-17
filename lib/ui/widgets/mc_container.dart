import 'package:flutter/material.dart';

import '../../utils/helpers.dart';
import '../../utils/mc_colors.dart';

/// changes color depending on app theme
class McContainer extends StatelessWidget {
  const McContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.darkThemeColor = McColors.white,
    this.lightThemeColor = McColors.white,
    this.margin,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.backgroundImage,
    this.backgroundImageFit = BoxFit.cover,
    this.boxShadow = const [
      BoxShadow(
        color: Color.fromARGB(255, 199, 186, 186),
        spreadRadius: -10,
        blurRadius: 20,
      ),
    ],
    this.gradient,
    this.border,
  });

  final double? width;
  final double? height;
  final Color darkThemeColor;
  final Color? lightThemeColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final ImageProvider? backgroundImage;
  final BoxFit backgroundImageFit;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        color: McHelpers.isDarkTheme(context)
            ? (gradient != null ? null : darkThemeColor)
            : lightThemeColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                fit: backgroundImageFit,
              )
            : null,
      ),
      child: child,
    );
  }
}
