import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../../utils/mc_colors.dart';

class McTextFormField extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? surffixIcon;
  final int? maxLines;
  final String? hintText;
  final Color fillColor;
  final Color hintColor;
  final Color labelColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final String? initialValue;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Function()? onTap;

  const McTextFormField({
    Key? key,
    this.controller,
    this.fillColor = McColors.secondary2,
    this.hintColor = McColors.lightGrey,
    this.labelColor = McColors.lightGrey,
    this.enabledBorderColor = McColors.lightGrey,
    this.focusedBorderColor = McColors.secondary,
    this.hintText,
    this.errorText,
    this.surffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.labelText,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McText(
          labelText ?? '',
          style: TextStyle(
            color: McColors.secondary,
          ),
        ),
        McVSpacer(5),
        TextFormField(
          style: GoogleFonts.jost(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          maxLines: maxLines,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscureText,
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          onSaved: onSaved,
          readOnly: readOnly,
          validator: validator,
          onTap: onTap,
          decoration: InputDecoration(
            errorText: errorText,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            prefixIcon: prefixIcon,
            suffixIcon: surffixIcon,
            isCollapsed: false,
            suffixIconColor: McColors.secondary2,
            prefixIconColor: McColors.secondary2,
            isDense: false,
            filled: true,
            fillColor: fillColor,
            labelText: labelText ?? hintText,
            iconColor: McColors.secondary2,
            suffixStyle: const TextStyle(color: McColors.secondary2),
            prefixStyle: const TextStyle(color: McColors.secondary2),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16, color: hintColor),
            labelStyle: TextStyle(fontSize: 14, color: labelColor),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(kTextFormFieldBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(kTextFormFieldBorderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: McColors.error,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(kTextFormFieldBorderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: McColors.error,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(kTextFormFieldBorderRadius),
            ),
            floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).colorScheme.error
                    : McColors.secondary;
                return TextStyle(color: color, letterSpacing: 1.3);
              },
            ),
          ),
        ),
      ],
    );
  }
}
