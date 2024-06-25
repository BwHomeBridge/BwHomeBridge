import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_file_selector_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text_form_field.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class IssueDetailsScreen extends StatelessWidget {
  const IssueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    //image
                    Positioned(
                      right: 0,
                      child: Image(
                        image: AssetImage('assets/images/deco1.png'),
                      ),
                    ),
                    // header content
                    Padding(
                      padding: const EdgeInsets.all(kSpacing),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              McIconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              McHSpacer(kSpacing),
                              McText.h2M('Issue reporting'),
                            ],
                          ),
                          McVSpacer(30),
                          McText.body(
                            'Help Us Improve Your Living Experience:\nSubmit Your Housing Concerns and\nRequests',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                child: Column(
                  children: [
                    McTextFormField(
                      labelText: 'Contact name',
                    ),
                    McVSpacer(),
                    McTextFormField(
                      labelText: 'Contact number',
                    ),
                    McVSpacer(),
                    McTextFormField(
                      labelText: 'Email',
                    ),
                    McVSpacer(),
                    McTextFormField(
                      labelText: 'Issue category',
                    ),
                    McVSpacer(),
                    McTextFormField(
                      labelText: 'Issue category',
                      maxLines: 4,
                    ),
                    McVSpacer(),
                    McFileSelectorField(
                      onFilesSelected: (files) {
                        // Handle the selected files
                        for (var file in files) {
                          print(
                              'Selected file: ${file.name}, path: ${file.path}');
                        }
                      },
                    ),
                    McVSpacer(30),
                    McButton(
                      'Submit',
                      expanded: true,
                      color: McColors.black,
                      onPressed: () {
                        AppRoutes.openNamed(
                            context, AppRoutes.issueReportSuccess);
                      },
                    ),
                    McVSpacer(50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
