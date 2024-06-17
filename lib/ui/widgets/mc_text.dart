import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/mc_styles.dart';

class McText extends StatelessWidget {
  ///
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;

  const McText(
    this.text, {
    Key? key,
    required this.style,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  }) : super(key: key);

  /// size: 24 weight: 400
  const McText.h1(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h1,
        super(key: key);

  /// size: 24 weight: 600
  const McText.h1M(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h1Medium,
        super(key: key);

  /// size: 24 weight: 900
  const McText.h1B(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h1Bold,
        super(key: key);

  /// size: 18 weight: 400
  const McText.h2(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h2,
        super(key: key);

  /// size: 18 weight: 600
  const McText.h2M(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h2Medium,
        super(key: key);

  /// size: 20 weight: 700
  const McText.h2B(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h2Bold,
        super(key: key);

  /// size: 16 weight: 400
  const McText.h3(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h3,
        super(key: key);

  /// size: 16 weight: 600
  const McText.h3M(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.h3M,
        super(key: key);

  /// size: 14 weight: 400
  const McText.body(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.body,
        super(key: key);

  /// size: 14 weight: 600
  const McText.bodyM(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.bodyMedium,
        super(key: key);

  /// size: 14 weight: 900
  const McText.bodyB(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.bodyBold,
        super(key: key);

  /// size: 16 weight: 400
  const McText.body2(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.body2,
        super(key: key);

  /// size: 16 weight: 600
  const McText.body2M(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.body2Medium,
        super(key: key);

  /// size: 16 weight: 900
  const McText.body2B(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.body2Medium,
        super(key: key);

  const McText.helper(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
  })  : style = McStyles.helper,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.jost(
        textStyle: style.copyWith(
          color: color,
          height: height,
        ),
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
