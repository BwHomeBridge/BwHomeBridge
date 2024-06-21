import 'package:bw_home_bridge/ui/screens/mortgage_calculator/widgets/payment_preview.dart';
import 'package:bw_home_bridge/ui/widgets/mc_slider.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class MortgageCalculatorScreen extends StatefulWidget {
  const MortgageCalculatorScreen({super.key});

  @override
  State<MortgageCalculatorScreen> createState() =>
      _MortgageCalculatorScreenState();
}

class _MortgageCalculatorScreenState extends State<MortgageCalculatorScreen> {
  //
  double homePrice = 0;
  double loanTerm = 10;
  double interestRate = 20;
  double downPayment = 20;

  double paymentEstimate = 0;

  double calculateMonthlyPayment() {
    double loanAmount = homePrice * ((100 - downPayment) / 100);
    double monthlyInterestRate = (interestRate / 100) / 12;
    int numberOfPayments = (loanTerm * 12).toInt();

    if (monthlyInterestRate == 0) {
      return loanAmount / numberOfPayments;
    }

    double monthlyPayment = loanAmount *
        (monthlyInterestRate *
            pow((1 + monthlyInterestRate), numberOfPayments)) /
        (pow((1 + monthlyInterestRate), numberOfPayments) - 1);

    paymentEstimate = monthlyPayment;
    return monthlyPayment;
  }

  refresh() {
    calculateMonthlyPayment();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(kSpacing),
                  child: Column(
                    children: [
                      McVSpacer(200),
                      McTextFormField(
                        initialValue: homePrice.toString(),
                        labelText: 'Home price',
                        onChanged: (price) {
                          try {
                            homePrice = double.tryParse(price)!;
                            refresh();
                          } catch (e) {}
                        },
                      ),
                      McVSpacer(),
                      McSlider(
                        label: 'Down payment',
                        valueText: '${downPayment.round().toString()} %',
                        max: 100,
                        onChanged: (double value) {
                          downPayment = value;
                          refresh();
                        },
                        value: downPayment,
                      ),
                      McVSpacer(),
                      McSlider(
                        label: 'Loan term',
                        valueText: '${loanTerm.round().toString()} years',
                        max: 50,
                        onChanged: (double value) {
                          loanTerm = value;
                          refresh();
                        },
                        value: loanTerm,
                      ),
                      McVSpacer(),
                      McSlider(
                        label: 'Interest rate',
                        valueText: '${interestRate.round().toString()} %',
                        max: 100,
                        onChanged: (double value) {
                          interestRate = value;
                          refresh();
                        },
                        value: interestRate,
                      ),
                    ],
                  ),
                ),
              ),
              //
              PaymentPreview(
                paymentEstimate: paymentEstimate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
