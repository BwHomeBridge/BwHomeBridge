import 'package:bw_home_bridge/ui/widgets/mc_container.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';

class CardDetailsForm extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;
  final Function(bool) onFocusChange;
  final VoidCallback onUpdate;

  CardDetailsForm({
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.cardHolderNameController,
    required this.onFocusChange,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return McContainer(
      child: Form(
        child: Column(
          children: [
            McTextFormField(
              controller: cardHolderNameController,
              labelText: 'Card Holder Name',
              onChanged: (_) => onUpdate(),
              onTap: () => onFocusChange(true),
            ),
            McTextFormField(
              controller: cardNumberController,
              labelText: 'Card Number',
              keyboardType: TextInputType.number,
              onChanged: (_) => onUpdate(),
              onTap: () => onFocusChange(true),
            ),
            Row(
              children: [
                Expanded(
                  child: McTextFormField(
                    controller: expiryDateController,
                    labelText: 'Expiry Date',
                    keyboardType: TextInputType.datetime,
                    onChanged: (_) => onUpdate(),
                    onTap: () => onFocusChange(true),
                  ),
                ),
                McHSpacer(kSpacing),
                Expanded(
                  child: McTextFormField(
                    controller: cvvController,
                    labelText: 'CVV',
                    keyboardType: TextInputType.number,
                    onChanged: (_) => onUpdate(),
                    onTap: () => onFocusChange(false),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
