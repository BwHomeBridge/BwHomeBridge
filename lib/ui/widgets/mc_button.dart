import 'package:flutter/material.dart';

import '../../utils/mc_colors.dart';
import '../../utils/mc_styles.dart';
import 'mc_h_spacer.dart';
import 'mc_text.dart';

class McButton extends StatelessWidget {
  final String text;
  final bool expanded;
  final Function()? onPressed;
  final bool isRounded;
  final Widget? leading;
  final Widget? trailing;
  final Color color;
  final Color textColor;
  final TextStyle? textStyle;
  final double? leftPadding;
  final double horizontalPadding;
  final double verticalPadding;
  final double? minWidth;
  final bool loading;
  final Color? loadingColor;
  final double elevation;

  const McButton(
    this.text, {
    Key? key,
    this.leading,
    this.trailing,
    this.color = McColors.primary,
    this.textColor = McColors.white,
    this.textStyle,
    this.expanded = false,
    this.isRounded = true,
    this.loading = false,
    this.loadingColor = McColors.secondary,
    this.minWidth,
    this.leftPadding,
    this.horizontalPadding = 62,
    this.verticalPadding = 5.5,
    this.elevation = 3,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      hoverElevation: 0,
      focusElevation: 0,
      onPressed: loading ? null : onPressed,
      color: color,
      disabledColor: color.withOpacity(.5),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      minWidth: minWidth ?? (expanded ? double.infinity : null),
      height: 46,
      shape: isRounded
          ? const StadiumBorder(
              side: BorderSide.none,
            )
          : const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
      child: loading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: loadingColor),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null) ...[
                  leading!,
                  const McHSpacer(12),
                ],
                McText(
                  text,
                  style: textStyle ??
                      McStyles.body2Medium.copyWith(
                        color: onPressed != null
                            ? textColor
                            : textColor.withOpacity(.5),
                      ),
                ),
                if (trailing != null) ...[
                  const McHSpacer(12),
                  trailing!,
                ],
              ],
            ),
    );
  }
}
