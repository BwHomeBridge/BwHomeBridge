import 'package:bw_home_bridge/backend/cubits/tender/tender_cubit.dart';
import 'package:bw_home_bridge/backend/cubits/tender/tender_state.dart';
import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_container.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/datetime_extentions.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TendersScreen extends StatelessWidget {
  const TendersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      McVSpacer(),
                      McIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      McVSpacer(),
                      McText(
                        'BHC\nTenders',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          color: McColors.primary,
                        ),
                      ),
                      McVSpacer(),
                      McText.body(kTendersSubTitle),
                      McVSpacer(),
                    ],
                  ),
                ),

                ///
                BlocBuilder<TenderCubit, TenderState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Center(child: Text('Welcome!')),
                      loading: () => Center(child: CircularProgressIndicator()),
                      loaded: (tenders) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: tenders.length,
                        itemBuilder: (context, index) {
                          final tender = tenders[index];
                          return McContainer(
                            margin: EdgeInsets.all(kSpacing).copyWith(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                McText.body(
                                  tender.title,
                                  color: McColors.grey,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          McText.h3M(
                                              'TOT Ref.No.: ${tender.id}'),
                                          McText.body(
                                              'Status: ${tender.status}'),
                                          McText.body(
                                              'Deadline: ${tender.deadline.toDayMonthYear()}'),
                                        ],
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: .6,
                                      child: McButton(
                                        'View details',
                                        elevation: 2,
                                        horizontalPadding: 20,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      error: (message) => Center(child: Text(message)),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
